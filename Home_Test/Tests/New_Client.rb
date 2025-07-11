# Tests/New_Client.rb

require 'selenium-webdriver'
require_relative '../Keywords/Login_Keywords'
require_relative '../Keywords/Client_Keywords'
require_relative '../Keywords/Navigation_Keywords'
require_relative '../Verifications/Client_Verifications'
include LoginKeywords
include ClientKeywords
include NavigationKeywords
include ClientVerifications
driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(timeout: 30)

login_simple_practice_with(:admin, driver, wait)
add_client(driver, wait, FIRST_NAME, LAST_NAME)
navigate_to_clients_page(driver, wait)
verificate_client_has_been_created(driver, wait, COMPLETE_NAME)
delete_client(driver, wait, COMPLETE_NAME)
verificate_client_has_been_deleted(driver, wait, COMPLETE_NAME)

sleep 5
driver.quit