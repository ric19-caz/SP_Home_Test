# Tests/Task_Page.rb

require 'selenium-webdriver'
require_relative '../Keywords/Login_Keywords'
require_relative '../Keywords/Navigation_Keywords'
require_relative '../Keywords/Task_Page_Keywords'
require_relative '../Verifications/Task_Page_Verifications'
include LoginKeywords
include NavigationKeywords
include TaskPageKeywords
include TaskPageVerifications

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(timeout: 30)

login_simple_practice_with(:admin, driver, wait)
navigate_to_task_page(driver, wait)
create_new_task(driver, wait, TASK_NAME, TASK_DESCRIPTION, TASK_DATE, TASK_TIME, TASK_PRIORITY, TASK_CLIENT, FILE_PATH )
verificate_task_has_been_created(driver, wait,TASK_NAME)
complete_task(driver, wait, TASK_NAME)
verificate_task_has_been_completed(driver, wait, TASK_NAME)
delete_task(driver, wait, TASK_NAME)
verificate_task_has_been_deleted(driver, wait, TASK_NAME)


sleep 5
driver.quit

