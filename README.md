# Cypress SauceDemo Tests

Simple Cypress automation tests for SauceDemo website with Allure reporting.

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/subhranshup87/Cypress_SauceLab_Demo.git
   cd Cypress_SauceLab_Demo
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Install Allure CLI:
   ```bash
   npm install -g allure-commandline
   ```

## Running Tests

Run everything with one command:
```bash
npm run test
```

This will:
- Clean old results
- Run tests in Chrome
- Generate Allure report
- Open report in browser

## Individual Commands

```bash
npm run test:chrome        # Run tests only
npm run report:generate    # Generate report only  
npm run report:open        # Open report only
npm run clean             # Clean old results only
```

## Test Reports

- **Local Reports**: Generated in `allure-report/` folder

## Tests Included

- Login with valid user
- Login with locked user  
- Add item to cart

## CI/CD

Tests run automatically on:
- Push to main
- Pull requests

Reports are deployed to GitHub Pages automatically.

## Files

- `cypress/tests/smoke/` - Test files
- `cypress.config.js` - Cypress configuration
- `package.json` - Dependencies and scripts
- `.github/workflows/` - CI/CD pipeline
