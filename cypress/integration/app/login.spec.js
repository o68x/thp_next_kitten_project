
// describe('My first Test', function () {
//     it('Does not much!', function() {
//         espect(true).to.equal(false)
//     })
// })



describe('Log in', function() {
  it('redirect to the login page', function () {
    cy.visit('/')
    cy.visit('/users/sign_up');
    cy.url().should('include', '/users/sign_up');
  });

  it('logs you in', function(){
    cy.get('input[name="user[email]"]').type('guigui@yopmail.com')
    cy.get('input[name="user[password]"]').type('pommes')
    cy.get('input[name="user[password_confirmation]"]').type('pommes')
    cy.get('input[name="commit"]').click();

    cy.get('input[value="Sign out"]').click()
  });
}); 

