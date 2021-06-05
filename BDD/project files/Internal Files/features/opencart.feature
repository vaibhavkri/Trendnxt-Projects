Feature: Opencart Application TC01
  Scenario: To Register and Add to the Cart
    Given Home page of Opencart
    And I click on the MyAccount Dropdown Button
    Then I click the Register link from the MyAccount dropdown
    And I passed "Priyankul" first name
    And I passed "Kashyap" second name
    And I Passed "PR20024026@w.com" email
    And I passed "1234567890" telephone number
    And I passed password "abc@123" to password field
    And I confirmed password at "abc@123" confirm password field
    And I click on the "1" on privacy policy
    And I clicked on the continue button
    Then I clicked on the contact Link
    And filled enquire textbox "Need to change address and phone number."
    Then I clicked on submit button
    And I clicked on Continue in contact Us Page
    Then I clicked the Samsung Galaxy Tab on home page
    And I clicked on the Review Tab
    And I wrote the review of the tab "Product is very good samsung galaxy"
    And I clicked on the rating 4
    And I clicked on review submit button
    Then I click on wishlist
    And I close the success message
    And I clicked on wishlist link
    Then I clicked on the Pound Sterling and checked the value displayed properly or not
    Then I clicked on the Euro and checked the value displayed properly or not
    Then I clicked on the dollar and checked the value displayed properly or not
    Then I clicked on Add To cart button
    And I close Success message
    Then I removed the content from wishlist
    And I clicked the logout button