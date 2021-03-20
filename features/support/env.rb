require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

require_relative "helpers"

# Deixa todos os métodos nativos do Cucumber
World(Helpers)

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = 'http://127.0.0.1:8080/login'
end