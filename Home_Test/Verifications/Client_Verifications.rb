require_relative '../Locators/Client_Locators'
require_relative '../Data/Client_Data/Add_Basic_Client'

module ClientVerifications
  include ClientLocators

  def verificate_client_has_been_created(driver, wait, client_complete_name)

    wait.until { driver.find_element(CLIENT_SEARCH_INPUT).displayed? }
    driver.find_element(CLIENT_SEARCH_INPUT).click
    wait.until { driver.find_element(CLIENT_SEARCH_INPUT).displayed? }
    driver.find_element(CLIENT_SEARCH_INPUT).send_keys(client_complete_name)
    locatorCLIENTNAME = CLIENT_NAME_LINK.call(client_complete_name)
    wait.until { driver.find_element(locatorCLIENTNAME).displayed? }
  end

  def verificate_client_has_been_deleted(driver, wait, client_complete_name)

    wait.until { driver.find_element(CLIENTS_AND_CONTACTS_LINK).displayed? }
    driver.find_element(CLIENTS_AND_CONTACTS_LINK).click
    wait.until { driver.find_element(CLIENT_SEARCH_INPUT).displayed? }
    locatorCLIENTNAME = CLIENT_NAME_LINK.call(client_complete_name)
    wait.until { driver.find_elements(locatorCLIENTNAME).empty? }
  end
end