# Cypress SauceDemo Smoke Tests

This project contains Cypress smoke tests for the SauceDemo web application with Allure reporting integration, Docker support, and automated CI/CD pipeline using GitHub Actions.

## 🚀 Features

- **Cypress E2E Tests**: Comprehensive smoke tests for SauceDemo application
- **Allure Reporting**: Beautiful HTML reports with test results, screenshots, and videos
- **Docker Support**: Containerized test execution for consistent environments
- **GitHub Actions CI/CD**: Automated testing on multiple browsers with artifact publishing
- **Cross-Browser Testing**: Support for Chrome and Firefox browsers
- **Scheduled Testing**: Daily automated test runs

## 📋 Prerequisites

- Node.js 18+ and npm
- Docker and Docker Compose (for containerized testing)
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

### Docker Setup

1. **Build Docker image:**
   ```bash
   npm run docker:build
   ```

2. **Or use Docker Compose:**
   ```bash
   docker-compose build
   ```

## 🧪 Running Tests

### Local Execution

1. **Run all tests:**
   ```bash
   npm run test
   ```

2. **Run tests in different browsers:**
   ```bash
   npm run test:firefox    # Firefox browser
   npm run test:headless   # Headless Chrome
   ```

3. **Run specific test:**
   ```bash
   npx cypress run --spec "cypress/tests/smoke/login.cy.js"
   ```

4. **Run tests with complete reporting:**
   ```bash
   npm run report
   ```

### Docker Execution

1. **Using shell script:**
   ```bash
   ./run-docker-tests.sh
   ```

2. **Using npm script:**
   ```bash
   npm run test:docker
   ```

3. **Using Docker Compose:**
   ```bash
   npm run docker:run
   ```

## 📊 Reports

### Allure Reports

1. **Generate report:**
   ```bash
   npm run report:generate
   ```

2. **Open report:**
   ```bash
   npm run report:open
   ```

3. **View report after Docker run:**
   ```bash
   allure open allure-report
   ```

### CI/CD Reports

- Reports are automatically generated and published as GitHub Pages
- Artifacts include test videos, screenshots, and HTML reports
- Access reports from the Actions tab in your GitHub repository

## 🐳 Docker Usage

### Available Docker Commands

```bash
# Build image
npm run docker:build

# Run tests in container
npm run docker:run

# Clean up Docker resources
npm run docker:clean
```

### Manual Docker Commands

```bash
# Build image
docker build -t cypress-saucedemo-tests .

# Run tests
docker run --rm \
  -v $(pwd)/allure-results:/app/allure-results \
  -v $(pwd)/allure-report:/app/allure-report \
  cypress-saucedemo-tests

# Run with Docker Compose
docker-compose up --build --abort-on-container-exit
```

## ⚙️ GitHub Actions

### Workflow Features

- **Multi-browser testing**: Chrome and Firefox
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

Add the following secrets to your GitHub repository:

- `CYPRESS_RECORD_KEY`: (Optional) For Cypress Dashboard integration

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
├── Dockerfile                   # Docker image configuration
├── docker-compose.yml           # Docker Compose configuration
├── cypress.config.js            # Cypress configuration
├── package.json                 # Node.js dependencies and scripts
├── run-tests.sh                 # Local test execution script
└── run-docker-tests.sh          # Docker test execution script
```

## 🔧 Configuration

### Cypress Configuration

Key configurations in `cypress.config.js`:
- Base URL: `https://www.saucedemo.com`
- Spec pattern: `cypress/tests/smoke/*.cy.js`
- Allure reporting enabled
- Default timeouts configured

### Docker Configuration

- Base image: `cypress/included:13.15.0`
- Includes Chrome browser and Node.js
- Allure CLI pre-installed
- Volume mounts for results and reports

## 🐛 Troubleshooting

### Common Issues

1. **Allure results not generated:**
   - Ensure `@shelex/cypress-allure-plugin` is imported in `cypress/support/e2e.js`
   - Check that the plugin is properly configured in `cypress.config.js`

2. **Docker build fails:**
   - Ensure Docker is running
   - Check network connectivity for npm installs
   - Verify Dockerfile syntax

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

# Verbose Docker build
docker build --no-cache -t cypress-saucedemo-tests .

# Check Docker logs
docker-compose logs
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
4. Run tests locally
5. Submit a pull request

## 📝 Notes

- Tests run against the live SauceDemo application
- Allure integration provides detailed test reporting
- Docker ensures consistent test environments
- GitHub Actions provides automated CI/CD pipeline
- Reports are preserved as artifacts for analysis

---

© 2025 Cypress SauceDemo Test Suite
