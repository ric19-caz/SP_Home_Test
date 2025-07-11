# Keywords/Navigation_Keywords.rb

require 'selenium-webdriver'
require_relative '../Locators/Navigation_Locators'

module NavigationKeywords
  include NavigationLocators

  def navigate_to_task_page(driver, wait)
    wait.until { driver.find_element(TASK_PAGE_BUTTON).displayed? }
    driver.find_element(TASK_PAGE_BUTTON).click
  end

  def navigate_to_clients_page(driver, wait)
    wait.until { driver.find_element(CLIENTS_BUTTON).displayed? }
    driver.find_element(CLIENTS_BUTTON).click
  end
end
