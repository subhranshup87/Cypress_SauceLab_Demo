const { defineConfig } = require('cypress');
const createBundler = require('@bahmutov/cypress-esbuild-preprocessor');
const allureWriter = require('@shelex/cypress-allure-plugin/writer');

module.exports = defineConfig({
  e2e: {
    env: {
      allure: true,
    },
    setupNodeEvents(on, config) {
      allureWriter(on, config);
      on('file:preprocessor', createBundler());
      return config;
    },
    baseUrl: 'https://www.saucedemo.com',
    specPattern: 'cypress/tests/smoke/*.cy.js',
    supportFile: 'cypress/support/e2e.js',
    defaultCommandTimeout: 8000,
    pageLoadTimeout: 15000,
    // Electron-specific optimizations
    chromeWebSecurity: false,
    video: false,
    screenshotOnRunFailure: true,
    // Add retries for stability
    retries: {
      runMode: 1,
      openMode: 0
    }
  },
});