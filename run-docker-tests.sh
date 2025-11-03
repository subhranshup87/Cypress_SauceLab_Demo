#!/bin/bash

# Script to run Cypress tests in Docker

echo "🐳 Starting Cypress tests in Docker..."

# Build and run tests using docker-compose
echo "🔨 Building Docker image and running tests..."
docker-compose up --build --abort-on-container-exit

# Check if tests completed successfully
if [ $? -eq 0 ]; then
    echo "✅ Docker tests completed successfully!"
    echo "📊 Allure report generated in allure-report/ directory"
    echo "🌐 To view report locally, run: allure open allure-report"
else
    echo "❌ Docker tests failed!"
    exit 1
fi

# Clean up containers
echo "🧹 Cleaning up Docker containers..."
docker-compose down