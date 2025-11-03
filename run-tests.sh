#!/bin/bash

# Script to run Cypress tests locally

echo "🚀 Starting Cypress SauceDemo Tests..."

# Clean previous results
echo "🧹 Cleaning previous test results..."
rm -rf allure-results allure-report cypress/videos cypress/screenshots

# Run tests
echo "🧪 Running Cypress tests..."
npm run test

# Check if tests completed successfully
if [ $? -eq 0 ]; then
    echo "✅ Tests completed successfully!"
    
    # Generate Allure report
    echo "📊 Generating Allure report..."
    allure generate allure-results --clean -o allure-report
    
    echo "📋 Report generated in allure-report/ directory"
    echo "🌐 To view report, run: allure open allure-report"
else
    echo "❌ Tests failed!"
    exit 1
fi