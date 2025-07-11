# Locators/Client_Locators.rb

module ClientLocators
  CREATE_CLIENT_BUTTON = { xpath: '//button[contains(@class, "button-navbar create") and .//span[contains(text(), "Create")]]' }
  CREATE_CLIENT_OPTION = { xpath: '//div[contains(@class, "ember-basic-dropdown-content")]//button[contains(.,"Create client")]' }
  CLIENT_FIRST_NAME_INPUT = { xpath: '//input[@name="firstName" and contains(@class, "spds-input")]' }
  CLIENT_LAST_NAME_INPUT  = { xpath: '//input[@name="lastName" and contains(@class, "spds-input")]' }
  CONTINUE_BUTTON = { xpath: '//button[@type="button" and contains(@class, "button primary") and normalize-space(text())="Continue"]' }
  CLIENT_SEARCH_INPUT = { xpath: '//input[@placeholder="Search" and contains(@class, "utility-search")]' }
  CLIENT_NAME_LINK = ->(client_complete_name) { { xpath: "//*[contains(@class, 'record-name') and normalize-space(text())='#{client_complete_name}']" } }
  EDIT_CLIENT_LINK = { xpath: "//a[contains(@href, '/edit') and normalize-space(text())='Edit']" }
  ACTIVE_CLIENT_STATUS_BUTTON = { xpath: "//button[contains(@class, 'active-menu-btn') and normalize-space(.)='Active']" }
  CLIENT_OPTIONS = "//div[contains(@class, 'ember-basic-dropdown-content')]//button"
  CLIENTS_AND_CONTACTS_LINK = {xpath: "//a[starts-with(@href, '/clients') and contains(., 'Clients')]"}
  
end