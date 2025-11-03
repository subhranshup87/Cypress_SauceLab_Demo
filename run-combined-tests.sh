#!/bin/bash

# Combined Browser Testing Script
# Runs tests in both Chrome and Electron, then generates a combined Allure report

echo "🧪 Starting combined browser testing..."

# Clean previous results
echo "🧹 Cleaning previous results..."
rm -rf allure-results allure-report combined-allure-results cypress/videos cypress/screenshots allure-results-*

# Create directories
mkdir -p allure-results-chrome allure-results-electron combined-allure-results

echo "🌐 Running Chrome tests (with Allure)..."
npx cypress run --browser chrome
if [ -d "allure-results" ]; then
  # Copy with browser prefix to avoid conflicts
  for file in allure-results/*; do
    if [ -f "$file" ]; then
      filename=$(basename "$file")
      if [[ "$filename" == *"-result.json" ]] || [[ "$filename" == *"-container.json" ]]; then
        cp "$file" "allure-results-chrome/chrome-$filename"
      else
        cp "$file" "allure-results-chrome/$filename"
      fi
    fi
  done
  echo "Browser=chrome" > allure-results-chrome/environment.properties
  rm -rf allure-results/*
fi

echo "⚡ Running Electron tests (with Allure)..."
npx cypress run --browser electron
if [ -d "allure-results" ]; then
  # Copy with browser prefix to avoid conflicts
  for file in allure-results/*; do
    if [ -f "$file" ]; then
      filename=$(basename "$file")
      if [[ "$filename" == *"-result.json" ]] || [[ "$filename" == *"-container.json" ]]; then
        cp "$file" "allure-results-electron/electron-$filename"
      else
        cp "$file" "allure-results-electron/$filename"
      fi
    fi
  done
  echo "Browser=electron" > allure-results-electron/environment.properties
fi

echo "🔄 Combining results..."
# Combine all results with proper handling
cp -r allure-results-chrome/* combined-allure-results/ 2>/dev/null || true
cp -r allure-results-electron/* combined-allure-results/ 2>/dev/null || true

# Create comprehensive environment file
echo "Creating combined environment file..."
echo "Chrome_Tests=Yes" > combined-allure-results/environment.properties
echo "Electron_Tests=Yes" >> combined-allure-results/environment.properties
echo "Total_Browsers=2" >> combined-allure-results/environment.properties
echo "Test_Date=$(date)" >> combined-allure-results/environment.properties

echo "📊 Results summary:"
echo "Chrome results: $(ls -1 allure-results-chrome/ 2>/dev/null | wc -l) files"
echo "Electron results: $(ls -1 allure-results-electron/ 2>/dev/null | wc -l) files"
echo "Combined results: $(ls -1 combined-allure-results/ 2>/dev/null | wc -l) files"

echo "📊 Generating combined Allure report..."
if [ "$(ls -A combined-allure-results)" ]; then
  allure generate combined-allure-results --clean -o allure-report
  echo "✅ Combined report generated!"
  echo "📈 Opening report..."
  allure open allure-report
else
  echo "❌ No test results found to generate report"
fi