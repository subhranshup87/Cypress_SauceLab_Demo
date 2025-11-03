// Only import Allure plugin if not disabled
if (Cypress.env('allure') !== false) {
  import('@shelex/cypress-allure-plugin');
}