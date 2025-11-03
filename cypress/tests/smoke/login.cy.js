import { inventorySelectors } from '../../support/selectors/inventorySelectors';
import { loginSelectors } from '../../support/selectors/loginSelectors';

describe('Login Test', () => {
  beforeEach(() => {
    cy.loadUsers();
  });

  it('should login successfully with valid credentials', () => {
    cy.loginAsStandardUser();
    cy.url().should('include', '/inventory.html');
    cy.get(inventorySelectors.inventoryItem).should('have.length.greaterThan', 0);
  });

  it('should show error for locked out user', () => {
    cy.loginAsLockedOutUser();
    cy.get(loginSelectors.errorMessage).should('be.visible');
    cy.get(loginSelectors.errorMessage).should('contain', 'locked out');
  });
});
