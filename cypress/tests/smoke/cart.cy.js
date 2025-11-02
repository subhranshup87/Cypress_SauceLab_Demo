import LoginPage from '../../support/pages/LoginPage';
import InventoryPage from '../../support/pages/InventoryPage';

describe('Add to Cart Test', () => {
  it('should add item to cart and verify', () => {
    LoginPage.visit();
    LoginPage.login('standard_user', 'secret_sauce');
    InventoryPage.addItemToCart();
    InventoryPage.openCart();
    InventoryPage.verifyItemInCart();
  });
});