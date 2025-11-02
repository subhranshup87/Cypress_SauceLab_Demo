import { loginSelectors } from '../selectors/loginSelectors';

class LoginPage {
  visit() {
    cy.visit('/');
  }
  login(username, password) {
    cy.get(loginSelectors.username).type(username);
    cy.get(loginSelectors.password).type(password);
    cy.get(loginSelectors.loginButton).click();
  }
}
export default new LoginPage();