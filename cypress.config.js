const { defineConfig } = require('cypress');
const createBundler = require('@bahmutov/cypress-esbuild-preprocessor');
const allureWriter = require('@shelex/cypress-allure-plugin/writer');

module.exports = defineConfig({
  e2e: {
    env: {
      allure: process.env.CYPRESS_allure !== 'false',
    },
    setupNodeEvents(on, config) {
      // Only setup Allure if not disabled
      if (process.env.CYPRESS_allure !== 'false') {
        allureWriter(on, config);
      }
      on('file:preprocessor', createBundler());
      return config;
    },
    baseUrl: 'https://www.saucedemo.com',
    specPattern: 'cypress/tests/smoke/*.cy.js',
    supportFile: 'cypress/support/e2e.js',
    defaultCommandTimeout: 5000,
    pageLoadTimeout: 10000,
    // Electron-specific optimizations
    chromeWebSecurity: false,
    video: false,
    screenshotOnRunFailure: true,
  },
});