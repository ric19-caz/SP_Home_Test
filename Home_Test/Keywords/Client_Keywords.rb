# Keywords/Client_Keywords.rb

require 'selenium-webdriver'
require_relative '../Locators/Client_Locators'
require_relative '../Data/Client_Data/Add_Basic_Client'

module ClientKeywords
  include ClientLocators

  def add_client(driver, wait, first_name, last_name)
    wait.until { driver.find_element(CREATE_CLIENT_BUTTON).displayed? }
    driver.find_element(CREATE_CLIENT_BUTTON).click
    wait.until { driver.find_element(CREATE_CLIENT_OPTION).displayed? }
    driver.find_element(CREATE_CLIENT_OPTION).click
    wait.until { driver.find_element(CLIENT_FIRST_NAME_INPUT).displayed? }
    driver.find_element(CLIENT_FIRST_NAME_INPUT).send_keys(first_name)
    wait.until { driver.find_element(CLIENT_LAST_NAME_INPUT).displayed? }
    driver.find_element(CLIENT_LAST_NAME_INPUT).send_keys(last_name)
    wait.until { driver.find_element(CONTINUE_BUTTON).displayed? }
    driver.find_element(CONTINUE_BUTTON).click
  end

  def delete_client(driver, wait, client_complete_name)
    locatorCLIENTNAME = CLIENT_NAME_LINK.call(client_complete_name)
    wait.until { driver.find_element(locatorCLIENTNAME).displayed? }
    driver.find_element(locatorCLIENTNAME).click
    wait.until { driver.find_element(EDIT_CLIENT_LINK).displayed? }
    driver.find_element(EDIT_CLIENT_LINK).click
    wait.until { driver.find_element(ACTIVE_CLIENT_STATUS_BUTTON).displayed? }
    driver.find_element(ACTIVE_CLIENT_STATUS_BUTTON).click
    wait.until do
      driver.find_elements(xpath: CLIENT_OPTIONS).any?
    end
    options = driver.find_elements(xpath: CLIENT_OPTIONS)
    archive_clicked = false
    options.each do |option|
      if option.text.strip.downcase.include?("archive")
        sleep 0.5
        option.click
        break
      end
    end
  end
end