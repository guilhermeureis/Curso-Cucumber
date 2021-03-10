require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"


# Capybara.register_driver :custom_chrome_headless do |app|
#     browser_options = ::Selenium::WebDriver::Chrome::Options.new
#     browser_options.args << '--headless'
#     browser_options.args << '--no-sandbox'
#     browser_options.args << '--disable-gpu'
#     browser_options.args << '--window-size=1920,1080'
#     Capybara::Selenium::Driver.new(
#       app,
#       browser: :chrome,
#       options: browser_options
#     )
# end
  
# Capybara.configure do |config|
#     config.default_driver = :custom_chrome_headless
#     config.app_host = 'http://127.0.0.1:8080/login'
# end


Capybara.configure do |config|
    # config.default_driver = :selenium_chrome_headless
    config.default_driver = :selenium_chrome
    config.app_host = 'http://127.0.0.1:8080/login'
    # config.app_host = 'http://google.com/'
end