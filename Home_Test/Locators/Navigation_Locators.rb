# Locators/Navigation_Locators.rb

module NavigationLocators
  TASK_PAGE_BUTTON = { xpath: '//a[@aria-label="Tasks"]' }
  CLIENTS_BUTTON = { xpath: '//a[contains(@class, "ember-view") and @href="/clients" and .//span[normalize-space(text())="Clients"]]' }
end