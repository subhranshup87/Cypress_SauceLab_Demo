# Cypress SauceDemo Smoke Tests

This project contains Cypress smoke tests for the SauceDemo web application with Allure reporting integration and automated CI/CD pipeline using GitHub Actions.

## 🚀 Features

- **Cypress E2E Tests**: Comprehensive smoke tests for SauceDemo application
- **Chrome Browser Testing**: Automated testing in Chrome browser
- **Allure Reporting**: Beautiful HTML reports with test results, screenshots, and videos
- **GitHub Actions CI/CD**: Automated testing with artifact publishing
- **GitHub Pages**: Automated report deployment at [Test Reports](https://subhranshup87.github.io/Cypress_SauceLab_Demo/)
- **Scheduled Testing**: Daily automated test runs

## 📋 Prerequisites

- Node.js 18+ and npm
- Allure CLI (for local report generation)

## 🛠️ Setup

### Local Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/subhranshup87/Cypress_SauceLab_Demo.git
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

### Available Commands

```bash
# Run tests in Chrome browser (default)
npm test

# Run tests with Allure reporting
npm run test:chrome

# Generate Allure report from results
npm run report:generate

# Open Allure report in browser
npm run report:open

# Serve Allure report live
npm run report:serve

# Clean test artifacts
npm run clean
```

### Local Execution Example

```bash
# Run tests and generate report
npm run test:chrome
npm run report:generate
npm run report:open
## 📊 Test Reports

- **Live Reports**: Available at [GitHub Pages](https://subhranshup87.github.io/Cypress_SauceLab_Demo/)
- **Local Reports**: Generated in `allure-report/` folder after running tests
- **Artifacts**: Available in GitHub Actions runs for failed tests (videos, screenshots)

## 🏗️ CI/CD Pipeline

The GitHub Actions workflow automatically:

1. **Triggers** on:
   - Push to `main` or `develop` branches
   - Pull requests to `main`
   - Daily at 9 AM UTC
   - Manual workflow dispatch

2. **Runs** Cypress tests in Chrome browser
3. **Generates** Allure reports
4. **Deploys** reports to GitHub Pages
5. **Uploads** artifacts (videos/screenshots) on failures

## 📁 Project Structure

```
├── .github/workflows/
│   └── cypress-tests.yml          # GitHub Actions workflow
├── cypress/
│   ├── fixtures/
│   │   └── users.json            # Test data
│   ├── support/
│   │   ├── commands.js           # Custom commands
│   │   ├── e2e.js               # Global config
│   │   ├── pages/               # Page objects
│   │   └── selectors/           # Element selectors
│   └── tests/
│       └── smoke/               # Smoke test files
├── allure-results/              # Raw test results
├── allure-report/               # Generated HTML reports
├── cypress.config.js            # Cypress configuration
└── package.json                 # Dependencies and scripts
```

## 🧪 Test Cases

The smoke test suite includes:

### Login Tests (`login.cy.js`)
- ✅ Valid user login verification
- ✅ Locked user error handling

### Cart Tests (`cart.cy.js`)
- ✅ Add items to cart functionality
- ✅ Cart item verification

## 🔧 Configuration

### Cypress Configuration (`cypress.config.js`)
- Base URL: `https://www.saucedemo.com`
- Browser: Chrome (headless in CI)
- Viewport: 1280x720
- Video recording: On failure
- Screenshot: On failure
- Allure reporting: Enabled
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
### Environment Variables
- `CYPRESS_allure=true`: Enables Allure reporting

## 🚨 Troubleshooting

### Common Issues

1. **Tests failing locally:**
   ```bash
   npm run clean
   npm install
   npm run test:chrome
   ```

2. **Allure reports not generating:**
   ```bash
   npm install -g allure-commandline
   npm run report:generate
   ```

3. **Permission issues:**
   ```bash
   chmod +x scripts/*.sh  # If using shell scripts
   ```

## 📈 Monitoring

- **GitHub Actions**: Check workflow status in the Actions tab
- **Test Reports**: Monitor daily at the GitHub Pages URL
- **Artifacts**: Download from failed workflow runs

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add/update tests as needed
5. Submit a pull request

## 📝 License

This project is for demonstration purposes.

---

**Live Test Reports**: [https://subhranshup87.github.io/Cypress_SauceLab_Demo/](https://subhranshup87.github.io/Cypress_SauceLab_Demo/)
