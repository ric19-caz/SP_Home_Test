# Locators/Task_Page_Locators.rb

module TaskPageLocators
  
  ADD_TASK_BUTTON = { xpath: '//a[normalize-space(text())="Add task"]' } 
  TASK_TITLE_INPUT = { xpath: '//input[@placeholder="Write a task"]' }
  TASK_DESCRIPTION_INPUT = { xpath: '//textarea[@placeholder="Add task description"]' }
  TASK_DATE_INPUT = { xpath: '//input[@name="datePicker" and @placeholder="mm/dd/yyyy"]' }
  TASK_TIME_INPUT = { xpath: '//input[@name="timePicker" and @placeholder="hh:mm aa"]' }
  TASK_PRIORITY_DROPDOWN_BUTTON = { xpath: '//button[contains(@class,"spds-input-dropdown-list-trigger")]' }
  TASK_PRIORITY_OPTIONS = { xpath: '//button[@role="option"]' }
  TASK_CLIENT_SELECT_BOX = { xpath: '//div[contains(@class,"select-box__selected-option") and contains(@class,"typeahead-trigger")]//span[normalize-space()="Select client"]' }
  TASK_CHOOSE_FILE_LABEL = { xpath: '//label[contains(text(),"Choose file") and contains(@class,"file-upload")]' }
  CLIENT_SEARCH_INPUT = { xpath: '//input[@role="searchbox" and contains(@class,"select-box__input")]' }
  CLIENT = ->(client_name) { { xpath: "//div[@role='option' and normalize-space(.)='#{client_name}']" } }
  TASK_FILE_HIDDEN_INPUT = { xpath: '//label[contains(@class,"file-upload")]//input[@type="file"]' }
  REVEAL_HIDDEN_INPUT_SCRIPT = "arguments[0].style.display = 'block';"
  SAVE_TASK_BUTTON = { xpath: '//button[@type="button" and normalize-space(text())="Save"]' }
  TASK_NAME_BUTTON = ->(task_name) {{ xpath: "//button[contains(normalize-space(.), '#{task_name}')]" }}
  TASK_CONTAINER = ->(task_name) { { xpath: "//button[contains(normalize-space(.), '#{task_name}')]/ancestor::div[contains(@class,'I26t1')]" }}
  EDIT_TASK_BUTTON = ->(task_name) {{ xpath: "//button[@type='button' and normalize-space(.)='#{task_name}']" } }
  CHECKABLE_CIRCLE = ".//div[contains(@class,'checkable-circle')]"
  FILTER_STATUS_BUTTON = { xpath: '//button[contains(@class,"utility-button-style") and contains(@value, "Incomplete")]' }
  FILTER_OPTIONS_IN_DROPDOWN = { xpath: '//div[contains(@class,"ember-basic-dropdown-content")]//div[contains(@class,"enSR2") or contains(@class,"ember-view")]//button | //div[contains(@class,"ember-basic-dropdown-content")]//div[@role="option"]' }
  FILTER_STATUS_OPTIONS = { xpath: '//div[contains(@class,"ember-basic-dropdown-content")]//div[@role="option" or @data-ebd-id]' }
  FILTER_OPTIONS = { xpath: '//div[@role="option"]' }
  DELETE_TASK_BUTTON = { xpath: '//footer//button[contains(@class,"negative") and normalize-space(text())="Delete task"]' }
  CONFIRM_DELETE_BUTTON = { xpath: '//div[contains(@class,"swal2-actions")]//button[contains(@class,"swal2-confirm") and contains(@class,"negative") and normalize-space(text())="Delete"]' }
end
