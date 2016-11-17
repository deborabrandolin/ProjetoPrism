require 'rspec'
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'yaml'
require 'cpf_faker'
require 'faker'
require 'site_prism'


Selenium::WebDriver::Firefox::Binary.path='C:\Program Files\Mozilla Firefox\firefox.exe'
Capybara.default_driver = :selenium
Capybara.javascript_driver = :webkit
Capybara.page.driver.browser.manage.window.maximize
Capybara.default_max_wait_time = 3

DEFAULT_DATA = (YAML.load_file('./fixtures/default_data.yml'))
