# Keywords/Task_Page_Keywords.rb

require 'selenium-webdriver'
require_relative '../Locators/Task_Page_Locators'
require_relative '../Data/Task_Page_Data/Add_Task'

module TaskPageKeywords
  include TaskPageLocators

  def create_new_task(driver, wait, title, description, date, time, priority, client, file_path)
    wait.until { driver.find_element(ADD_TASK_BUTTON).displayed? }
    driver.find_element(ADD_TASK_BUTTON).click

    wait.until { driver.find_element(TASK_TITLE_INPUT).displayed? }
    driver.find_element(TASK_TITLE_INPUT).send_keys(title)

    wait.until { driver.find_element(TASK_DESCRIPTION_INPUT).displayed? }
    driver.find_element(TASK_DESCRIPTION_INPUT).send_keys(description)

    wait.until { driver.find_element(TASK_DATE_INPUT).displayed? }
    driver.find_element(TASK_DATE_INPUT).send_keys(date, :enter)

    wait.until { driver.find_element(TASK_TIME_INPUT).displayed? }
    driver.find_element(TASK_TIME_INPUT).send_keys(time, :enter)

    wait.until { driver.find_element(TASK_PRIORITY_DROPDOWN_BUTTON).displayed? }
    driver.find_element(TASK_PRIORITY_DROPDOWN_BUTTON).click

    wait.until { driver.find_elements(TASK_PRIORITY_OPTIONS).any? }
    priority_options = driver.find_elements(TASK_PRIORITY_OPTIONS)
    priority_options.each do |option|
      if option.text.strip == priority
        option.click
        break
      end
    end

    wait.until { driver.find_element(TASK_CLIENT_SELECT_BOX).displayed? }
    driver.find_element(TASK_CLIENT_SELECT_BOX).click

    wait.until { driver.find_element(CLIENT_SEARCH_INPUT).displayed? }
    driver.find_element(CLIENT_SEARCH_INPUT).send_keys(client)

    locatorCLIENT = CLIENT.call(client)
    wait.until { driver.find_element(locatorCLIENT).displayed? }
    driver.find_element(locatorCLIENT).click

    file_input = wait.until { driver.find_element(TASK_FILE_HIDDEN_INPUT) }
    driver.execute_script(REVEAL_HIDDEN_INPUT_SCRIPT, file_input)
    file_input.send_keys(file_path)

    wait.until { driver.find_element(SAVE_TASK_BUTTON).displayed? }
    driver.find_element(SAVE_TASK_BUTTON).click
  end

  def complete_task(driver, wait, task_name)
    task_button = wait.until { driver.find_element(TASK_NAME_BUTTON.call(task_name)) }

    container = task_button.find_element(TASK_CONTAINER.call(task_name))
    circle = container.find_element(xpath: CHECKABLE_CIRCLE)
    wait.until { circle.displayed? && circle.enabled? }
    circle.click
  end

  def delete_task(driver, wait, task_name)
    locatorTASKNAME = EDIT_TASK_BUTTON.call(task_name)
    wait.until { driver.find_element(locatorTASKNAME).displayed? }
    driver.find_element(locatorTASKNAME).click

    wait.until { driver.find_element(DELETE_TASK_BUTTON).displayed? }
    driver.find_element(DELETE_TASK_BUTTON).click
    wait.until { driver.find_element(CONFIRM_DELETE_BUTTON).displayed? }
    driver.find_element(CONFIRM_DELETE_BUTTON).click
  end
end
