import { inventorySelectors } from '../selectors/inventorySelectors';

class InventoryPage {
  addItemToCart() {
    cy.get(inventorySelectors.addToCartButton).click();
  }
  openCart() {
    cy.get(inventorySelectors.cartIcon).click();
  }
  verifyItemInCart() {
    cy.get(inventorySelectors.cartItem).should('exist');
  }
}
export default new InventoryPage();