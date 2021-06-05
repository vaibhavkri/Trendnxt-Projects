require 'watir-webdriver'

 Selenium::WebDriver::Chrome::Service.executable_path="C:\\Users\\VA20024031\\Downloads\\chromedriver_win32\\chromedriver.exe"
 $driver=Watir::Browser.new :chrome

Given(/^Home page of Opencart TC02$/) do
  $driver.goto("http://spezicoe.wipro.com:81/opencart1/")
end

And(/^I click on the MyAccount Dropdown$/) do
  $driver.link(:xpath=>"//*[@id='top-links']//ul//li[2]//a").click
end

Then(/^I click the Register link from the MyAccount$/) do
  $driver.link(:href=>"http://spezicoe.wipro.com:81/opencart1/index.php?route=account/login").click
end

And(/^I passed "([^"]*)" Login$/) do |arg|
  $driver.text_field(:name=>"email").set arg
end

And(/^I passed "([^"]*)" password$/) do |arg|
  $driver.text_field(:name=>"password").set arg
end

And(/^I clicked on the login button$/) do
  $driver.button(:value=>"Login").click
end

And(/^I validate the search "([^"]*)"$/) do |arg|
  $driver.text_field(:name=>"search").set arg
end

And(/^I clicked searched button$/) do
  $driver.button(:class=>"btn btn-default btn-lg").click
end


And(/^I select "([^"]*)" from "([^"]*)" combo$/) do |arg1, arg2|
  $driver.select_list(:name=> arg2).select arg1
end

Then(/^I clicked search button$/) do
  $driver.button(:id=> "button-search").click
end


And(/^I clicked on Phone & PDA link$/) do
$driver.link(:href=> "http://spezicoe.wipro.com:81/opencart1/index.php?route=product/category&path=24").click
end

And(/^I Select high to low options$/) do
  $driver.select_list(:xpath=> "//*[@id='input-sort']/option[5]").select "Price (High > Low)"
end

And(/^I clicked one product$/) do
  $driver.button(:xpath=> "//*[@id='content']/div[2]/div[1]/div/div[2]/div[2]/button[3]").click
  $driver.button(:class=>"close").click
end

And(/^I click two products$/) do
  $driver.button(:xpath=> "//*[@id='content']/div[2]/div[2]/div/div[2]/div[2]/button[3]").click
  $driver.button(:class=> "close").click
end

And(/^I clicked third products$/) do
  $driver.button(:xpath=> "//*[@id='content']/div[2]/div[3]/div/div[2]/div[2]/button[3]").click
  $driver.button(:class=> "close").click
end

And(/^I clicked on product comparison link$/) do
  $driver.link(:href=> "http://spezicoe.wipro.com:81/opencart1/index.php?route=product/compare").click

end

And(/^I clicked on HTC phone$/) do
  $driver.link(:href=> "http://spezicoe.wipro.com:81/opencart1/index.php?route=product/product&product_id=29").click

end

Then(/^I clicked add to cart button$/) do
  $driver.button(:id=> "button-cart").click
end

And(/^I clicked on Shopping cart$/) do
  $driver.link(:href=> "http://spezicoe.wipro.com:81/opencart1/index.php?route=checkout/cart").click

end

And(/^I clicked on Checkout link$/) do
  $driver.link(:href=> "http://spezicoe.wipro.com:81/opencart1/index.php?route=checkout/checkout").click

end


And(/^I passed "([^"]*)" first name in the Billing Details$/) do |arg|
  $driver.text_field(:name=>"firstname").set arg
end

And(/^I passed "([^"]*)" second name in the billing Details$/) do |arg|
  $driver.text_field(:name=>"lastname").set arg
end

And(/^I passed "([^"]*)" address in the billing Details$/) do |arg|
  $driver.text_field(:name=>"address_1").set arg
end

And(/^I passed "([^"]*)" city in the billing Details$/) do |arg|
  $driver.text_field(:name=>"city").set arg
end

And(/^I passed "([^"]*)" post code in the billing Details$/) do |arg|
  $driver.text_field(:name=>"postcode").set arg
end

And(/^I select "([^"]*)" from "([^"]*)" combo1$/) do |arg1, arg2|
  $driver.select_list(:name=> arg2).select arg1
end

And(/^I clicked on continue first button$/) do
 $driver.button(:id=> "button-payment-address").click

end


And(/^I clicked on continue second button$/) do
  $driver.button(:id=> "button-shipping-address").click

end

And(/^I clicked on continue last button$/) do
  $driver.button(:id=> "button-shipping-method").click

end

And(/^I clicked on "([^"]*)" on privacy policy$/) do |arg|
  $driver.checkbox(:name=>"agree").set arg
end

And(/^I clicked on the final continue button$/) do
  $driver.button(:id=> "button-payment-method").click

end

Then(/^I clicked on the confirm order$/) do
  $driver.button(:id=> "button-confirm").click

end

Then(/^The Text should appear as "([^"]*)"$/) do |arg|
  checktext= $driver.link(:href=> "http://spezicoe.wipro.com:81/opencart1/index.php?route=checkout/success").text
  puts "The value is ##{checktext}"

  if arg == checktext
    puts "Your order has been successfully processed!: Passed"
  else
    puts "Your order has NOT been unsuccessfully processed!: Failed"
  end
end

And(/^I clicked on back and My accounts$/) do
  $driver.link(:href=> "http://spezicoe.wipro.com:81/opencart1/index.php?route=account/account").click
  
end

And(/^I clicked on Order History$/) do
  $driver.link(:href=> "http://spezicoe.wipro.com:81/opencart1/index.php?route=account/order").click
  String tittle= $driver.getTittle()
  if tittle.eql? "Account"
    puts "proper page displayed"
  else
    puts "Proper page not displayed"
  end
end


And(/^I clicked on Newletter$/) do
  $driver.link(:href=> "http://spezicoe.wipro.com:81/opencart1/index.php?route=account/newsletter").click

end

Then(/^Clicked on continue button in the newletter$/) do
  $driver.button(:xpath=> "//*[@id='content']/form/div/div[2]/input").click

end

And(/^I clicked on Extra special$/) do
  $driver.link(:href=> "http://spezicoe.wipro.com:81/opencart1/index.php?route=product/special").click

end

And(/^I clicked on Listview button$/) do
  $driver.button(:id=> "list-view").click

end

And(/^I clicked on My Account$/) do
  $driver.link(:href=>"http://spezicoe.wipro.com:81/opencart1/index.php?route=account/account").click

end

Then(/^I clicked the logout$/) do
  $driver.link(:href=> "http://spezicoe.wipro.com:81/opencart1/index.php?route=account/account").click

end