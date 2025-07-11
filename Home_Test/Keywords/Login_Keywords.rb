# Keywords/Login_Keywords.rb

require 'selenium-webdriver'
require_relative '../Locators/Login_Locators'
require_relative '../Data/Login_Data/Users'

module LoginKeywords
  include LoginLocators

  def login_simple_practice_with(user_type, driver, wait)
    user = Users.get(user_type)
    raise "Tipo de usuario desconocido: #{user_type}" unless user

    driver.navigate.to user[:url]
    driver.manage.window.maximize
    wait.until { driver.find_element(EMAIL_INPUT).displayed? }
    driver.find_element(EMAIL_INPUT).send_keys(user[:email])
    wait.until { driver.find_element(PASSWORD_INPUT).displayed? }
    driver.find_element(PASSWORD_INPUT).send_keys(user[:password])
    wait.until { driver.find_element(SIGN_IN_BUTTON).displayed? }
    driver.find_element(SIGN_IN_BUTTON).click
  end
end


