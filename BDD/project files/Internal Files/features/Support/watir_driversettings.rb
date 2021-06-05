require 'watir-webdriver'
Selenium::WebDriver::Chrome::Service.executable_path="H:\\chromedriver.exe"
$driver = Watir:: Browser.new :chrome
$driver.driver.manage.timeouts.implicit_wait = 5