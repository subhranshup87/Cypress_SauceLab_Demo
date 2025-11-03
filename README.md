# Cypress SauceDemo Smoke Tests

This project contains Cypress smoke tests for the SauceDemo web application with Allure reporting integration and automated CI/CD pipeline using GitHub Actions.

## 🚀 Features

- **Cypress E2E Tests**: Comprehensive smoke tests for SauceDemo application
- **Cross-Browser Testing**: Support for Chrome and Electron browsers
- **Allure Reporting**: Beautiful HTML reports with test results, screenshots, and videos
- **GitHub Actions CI/CD**: Automated testing on multiple browsers with artifact publishing
- **GitHub Pages**: Automated report deployment
- **Scheduled Testing**: Daily automated test runs

## 📋 Prerequisites

- Node.js 18+ and npm
- Allure CLI (for local report generation)

## 🛠️ Setup

### Local Setup

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd Cypress_SauceLab_Demo
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Install Allure CLI globally:**
   ```bash
   npm install -g allure-commandline
   ```

## 🧪 Running Tests

### Local Execution

1. **Run Chrome tests:**
   ```bash
   npm run test:chrome
   ```

2. **Run Electron tests:**
   ```bash
   npm run test:electron
   ```

3. **Run both browsers:**
   ```bash
   npm run test:both
   ```

4. **Run with complete reporting:**
   ```bash
   npm run report
   ```

5. **Run specific test:**
   ```bash
   npx cypress run --spec "cypress/tests/smoke/login.cy.js"
   ```

## 📊 Reports

### Allure Reports

1. **Generate and view report:**
   ```bash
   npm run report
   ```

2. **Access CI reports:**
   - Reports are automatically generated and published as GitHub Pages
   - Artifacts include test videos, screenshots, and HTML reports
   - Access reports from the Actions tab in your GitHub repository

## ⚙️ GitHub Actions

### Workflow Features

- **Multi-browser testing**: Chrome and Electron in parallel
- **Scheduled runs**: Daily at 9 AM UTC
- **Manual triggers**: Workflow dispatch
- **Artifact uploads**: Reports, videos, and screenshots
- **GitHub Pages deployment**: Automatic report publishing

### Workflow Triggers

- Push to `main` or `develop` branches
- Pull requests to `main`
- Daily scheduled runs
- Manual workflow dispatch

### Secrets Configuration

Add the following secrets to your GitHub repository (optional):

- `CYPRESS_RECORD_KEY`: For Cypress Dashboard integration

## 📁 Project Structure

```
Cypress_SauceLab_Demo/
├── .github/
│   └── workflows/
│       └── cypress-tests.yml     # GitHub Actions workflow
├── cypress/
│   ├── fixtures/                 # Test data
│   ├── support/                  # Custom commands and configurations
│   └── tests/
│       └── smoke/               # Smoke test suite
├── allure-results/              # Test execution results
├── allure-report/               # Generated HTML reports
├── cypress.config.js            # Cypress configuration
├── package.json                 # Node.js dependencies and scripts
└── README.md                    # This file
```

## 🔧 Configuration

### Cypress Configuration

Key configurations in `cypress.config.js`:
- Base URL: `https://www.saucedemo.com`
- Spec pattern: `cypress/tests/smoke/*.cy.js`
- Allure reporting enabled (disabled for Electron to prevent conflicts)
- Default timeouts configured

### Browser-Specific Settings

- **Chrome**: Full Allure reporting enabled
- **Electron**: Allure disabled for better performance and stability

## 🐛 Troubleshooting

### Common Issues

1. **Allure results not generated:**
   - Ensure `@shelex/cypress-allure-plugin` is imported in `cypress/support/e2e.js`
   - Check that the plugin is properly configured in `cypress.config.js`

2. **Electron tests hanging:**
   - Allure plugin is automatically disabled for Electron
   - Use `npm run test:electron` for optimized Electron testing

3. **Tests fail in CI:**
   - Check browser compatibility
   - Verify environment variables
   - Review test timeouts for CI environment

4. **Dependencies issues:**
   ```bash
   rm -rf node_modules package-lock.json
   npm install
   ```

### Debug Commands

```bash
# Check Cypress installation
npx cypress verify

# Debug test in interactive mode
npx cypress open

# Run tests with debug output
DEBUG=cypress:* npm run test
```

## 📈 Continuous Integration

### Branch Protection

Recommended branch protection rules:
- Require status checks to pass
- Require up-to-date branches
- Include administrators

### Monitoring

- Monitor test execution in GitHub Actions
- Review Allure reports for test insights
- Track test trends and failures

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests locally: `npm run test:both`
5. Submit a pull request

## 📝 Notes

- Tests run against the live SauceDemo application
- Allure integration provides detailed test reporting for Chrome
- GitHub Actions provides automated CI/CD pipeline
- Reports are preserved as artifacts and deployed to GitHub Pages
- Cross-browser testing ensures compatibility across different environments

---

© 2025 Cypress SauceDemo Test Suite
