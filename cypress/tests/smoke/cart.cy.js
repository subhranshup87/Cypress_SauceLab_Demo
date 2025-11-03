import InventoryPage from '../../support/pages/InventoryPage';
import { inventorySelectors } from '../../support/selectors/inventorySelectors';

describe('Add to Cart Test', () => {
  beforeEach(() => {
    cy.loadUsers();
  });

  it('should add item to cart and verify', () => {
    cy.loginAsStandardUser();
    InventoryPage.addItemToCart();
    InventoryPage.openCart();
    cy.url().should('include', '/cart.html');
    cy.get(inventorySelectors.cartItem).should('have.length', 1);
  });
});