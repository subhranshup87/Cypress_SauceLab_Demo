# Saucedemo Smoke Tests

This project contains Cypress smoke tests for the SauceDemo web application, with Allure reporting integration.

## Setup

1. **Install dependencies:**
   ```sh
   npm install
   ```

2. **Run tests:**
   ```sh
   npx cypress run (To run suite)
   npx cypress run -s cypress/e2e/login.cy.js (To run specific test)
   ```
   - Allure results will be generated automatically in the `allure-results` folder.

3. **View Allure Report:**
   - Install Allure commandline if not already installed:
     ```sh
     npm install -g allure-commandline --save-dev
     ```
   - Generate and open the report:
     ```sh
     allure serve allure-results
     ```

## Notes
- Allure integration is enabled by default. No need to pass `--env allure=true`.
- Test specs are located in `cypress/e2e/`.
- Custom commands and page objects are in `cypress/support/`.

## Troubleshooting
- If `allure-results` is not generated, ensure dependencies are installed and the plugin is correctly imported in `cypress/support/e2e.js`:
  ```js
  import '@shelex/cypress-allure-plugin';
  ```
- For any issues, try deleting `node_modules` and `package-lock.json`, then run `npm install` again.

---

© 2025 Your Name or Company
