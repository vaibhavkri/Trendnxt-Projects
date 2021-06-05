require 'selenium-webdriver'

Selenium::WebDriver::Chrome.driver_path="C:\\Users\\EL848188\\Downloads\\chromedriver_win32\\chromedriver.exe"
driver=Selenium::WebDriver.for :chrome
driver.navigate.to "http://10.207.182.108:81/opencart/"
driver.manage.window.maximize

driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=account/account").click
driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=account/login").click
driver.find_element(:name,"email").send_keys("ilavarasan.r93@gmail.com")
driver.find_element(:name,"password").send_keys("199305erc@")
driver.find_element(:value,"Login").click
driver.find_element(:name,"search").send_keys("apple")
driver.find_element(:class,"btn btn-default btn-lg").click
driver.find_element(:xpath,"html/body/div[2]/div/div/div[2]/div[3]/div/select")
driver.find_element(:name,"sub_category").click
driver.find_element(:id,"button-search").click
String canon=driver.find_element(:xpath,"//*[@id='content'/div[3]/div/div/div[2]/div[1]/h4/a").getText()
  if canon.eql? "Apple Cinema 30"
  puts "Canon Product is displayed"
 else
       puts "Canon Product is not displayed"
  end
driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=product/category&path=24").click
driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=product/category&path=24").click
driver.find_element(:xpath,"//*[@id='content']/div[2]/div[1]/div/div[2]/div[2]/button[3]").click
driver.find_element(:class,"close").click
driver.find_element(:xpath,"//*[@id='content']/div[2]/div[2]/div/div[2]/div[2]/button[3]").click
driver.find_element(:class,"close").click
driver.find_element(:xpath,"//*[@id='content']/div[2]/div[3]/div/div[2]/div[2]/button[3]").click
driver.find_element(:class,"close").click
driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=product/compare").click
driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=product/product&product_id=28").click
String canon1=driver.find_element(:xpath,"//li[contains(text(),'Tri-band')]").getText()
f = File.new('C:\\Users\\EL848188\\Documents\\debug.txt', 'w')
f.write(canon1)
f.close

driver.find_element(:id,"button-cart").click
driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=product/product&product_id=28").click
driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=checkout/cart").click
driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=checkout/checkout").click

driver.find_element(:xpath,"html/body/div[2]/div/div/div/div[2]/div[2]/div/form/div[5]/div/input").click
driver.find_element(:xpath,"html/body/div[2]/div/div/div/div[3]/div[2]/div/form/div[5]/div/input").click
driver.find_element(:xpath,"html/body/div[2]/div/div/div/div[4]/div[2]/div/div[2]/div/input").click
driver.find_element(:name,"agree").click
driver.find_element(:xpath,"html/body/div[2]/div/div/div/div[5]/div[2]/div/div[2]/div/input[2]").click
driver.find_element(:id,"button-confirm").click
driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=checkout/checkout").click

String canon2=driver.find_element(:xpath,"//div[@id='content']/p").getText()
if canon2.eql? "Your shopping cart is empty!"
  puts "Your shopping cart is empty!"
else
  puts "Your shopping cart is not empty!"
end

driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=account/account").click
driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=account/order").click

String tittle=driver.getTittle()
if tittle.eql? "Account"
  puts "proper page displayed"
else
  puts "Proper page not displayed"
end

driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=account/newsletter").click
driver.find_element(:name,"newsletter").click
driver.find_element(:value,"Continue").click
driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=product/special").click
driver.find_element(:id,"list-view").click
driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=account/account").click
driver.find_element(:link,"http://spezicoe.wipro.com:81/opencart/index.php?route=account/logout").click