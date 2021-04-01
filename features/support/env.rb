require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "os"

require_relative "helpers"

# Deixa todos os métodos nativos do Cucumber
World(Helpers)

# Before do
#     Capybara.page.current_window.resize_to(1280,800)
# end

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = 'http://127.0.0.1:8080/login'
    config.default_max_wait_time = 10
end