import LoginPage from '../../support/pages/LoginPage';

describe('Login Test', () => {
  beforeEach(() => {
    cy.fixture('users').as('usersData');
  });

  it('should login successfully with valid credentials', function () {
    const validUser = this.usersData.find(user => user.role === 'valid');

    LoginPage.visit();
    LoginPage.login(validUser.username, validUser.password);
    cy.url().should('include', '/inventory.html');
  });

  it('should show error for locked out user', function () {
    const lockedUser = this.usersData.find(user => user.role === 'locked');

    LoginPage.visit();
    LoginPage.login(lockedUser.username, lockedUser.password);
    cy.get('[data-test="error"]').should('contain', 'Sorry, this user has been locked out.');
  });
});
