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
  cp -r allure-results/* allure-results-chrome/
  echo '{"name":"Browser","value":"chrome"}' > allure-results-chrome/environment.properties
  rm -rf allure-results/*
fi

echo "⚡ Running Electron tests (with Allure)..."
npx cypress run --browser electron
if [ -d "allure-results" ]; then
  cp -r allure-results/* allure-results-electron/
  echo '{"name":"Browser","value":"electron"}' > allure-results-electron/environment.properties
fi

echo "🔄 Combining results..."
# Combine all results
cp -r allure-results-chrome/* combined-allure-results/ 2>/dev/null || true
cp -r allure-results-electron/* combined-allure-results/ 2>/dev/null || true

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