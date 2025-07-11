# Verifications/Task_Page_Verifications.rb

require 'selenium-webdriver'
require_relative '../Locators/Task_Page_Locators'
require_relative '../Data/Task_Page_Data/Add_Task'

module TaskPageVerifications
  include TaskPageLocators

  def verificate_task_has_been_created(driver, wait, task_name)
    locatorTASKNAME = EDIT_TASK_BUTTON.call(task_name)
    wait.until { driver.find_element(locatorTASKNAME).displayed? }
  end

  def verificate_task_has_been_completed(driver, wait, task_name)
    wait.until { driver.find_element(FILTER_STATUS_BUTTON).displayed? }
    driver.find_element(FILTER_STATUS_BUTTON).click

    wait.until do
      driver.find_elements(FILTER_OPTIONS_IN_DROPDOWN).any?(&:displayed?)
    end

    options = driver.find_elements(FILTER_OPTIONS_IN_DROPDOWN)
    options.each do |option|
      if option.displayed? && option.text.strip == 'Completed'
        option.click
        break
      end
    end

    task_locator = EDIT_TASK_BUTTON.call(task_name)
    wait.until { driver.find_element(task_locator).displayed? }
  end

  def verificate_task_has_been_deleted(driver, wait, task_name)
    locatorTASKNAME = EDIT_TASK_BUTTON.call(task_name)
    wait.until { driver.find_elements(locatorTASKNAME).empty? }
  end
end
