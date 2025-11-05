import { loginSelectors } from './selectors/loginSelectors';

// -------------------- FIXTURE COMMANDS --------------------
// Custom command to load users fixture
Cypress.Commands.add('loadUsers', () => {
  return cy.fixture('users').as('usersData');
});

// -------------------- LOGIN COMMANDS --------------------
// Command to login with different user types
Cypress.Commands.add('loginAs', function(userRole) {
  const user = this.usersData.find(u => u.role === userRole);
  if (!user) {
    throw new Error(`User with role '${userRole}' not found`);
  }
  
  cy.visit('/');
  cy.get(loginSelectors.username).type(user.username);
  cy.get(loginSelectors.password).type(user.password);
  cy.get(loginSelectors.loginButton).click();
});

// Quick login command for standard user
Cypress.Commands.add('loginAsStandardUser', () => {
  cy.loginAs('valid');
});

// Quick login command for locked out user
Cypress.Commands.add('loginAsLockedOutUser', () => {
  cy.loginAs('locked');
});