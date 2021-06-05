Feature: Opencart Application TC02
  Scenario: Product Comparison
    Given Home page of Opencart TC02
    And I click on the MyAccount Dropdown
    Then I click the Register link from the MyAccount
    And I passed "PR20024026@w.com" Login
    And I passed "abc@123" password
    And I clicked on the login button
    And I validate the search "apple"
    And I clicked searched button
    And I select "Desktops" from "category_id" combo
    Then I clicked search button
    And I clicked on Phone & PDA link
    And I Select high to low options
    And I clicked one product
    And I click two products
    And I clicked third products
    And I clicked on product comparison link
    And I clicked on HTC phone
    Then I clicked add to cart button
    And I clicked on Shopping cart
    And I clicked on Checkout link
    And I passed "Priyankul" first name in the Billing Details
    And I passed "Kashyap" second name in the billing Details
    And I passed "D-27" address in the billing Details
    And I passed "Noida" city in the billing Details
    And I passed "201301" post code in the billing Details
    And I select "India" from "country_id" combo1
    And I select "Uttar Pradesh" from "zone_id" combo1
    And I clicked on continue first button
    And I clicked on continue second button
    And I clicked on continue last button
    And I clicked on "1" on privacy policy
    And I clicked on the final continue button
    Then I clicked on the confirm order
    Then The Text should appear as "Success"
    And I clicked on back and My accounts
    And I clicked on Order History
    And I clicked on Newletter
    Then Clicked on continue button in the newletter
    And I clicked on Extra special
    And I clicked on Listview button
    And I clicked on My Account
    Then I clicked the logout





