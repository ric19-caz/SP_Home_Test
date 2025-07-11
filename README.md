
##Prerequisites

Make sure the following are installed and configured properly:

- Ruby (version 3.4.0 or compatible)
- Google Chrome browser
- ChromeDriver matching your Chrome version and accessible in your system PATH
- Bundler:

gem install bundler

Selenium WebDriver (if no Gemfile is used):

gem install selenium-webdriver


##How to Execute Tests

1. Download the main folder (Home_Test) into C:

2. Open a terminal and navigate to the `Tests/` folder inside `C:/Home_Test/`:

cd C:/Home_Test/Tests


3. Run the main test file depending on the solution:

ruby Task_Page.rb
ruby New_Client.rb

##Notes

- Ensure the Chrome browser is **not running in the background** to avoid WebDriver conflicts.
- The script includes proper waits and dynamic selectors. If an element is updated or missing, it will timeout after 30 seconds. This duration accounts for potential slow internet connections.
-  Make sure to place the required Excel file (test_task_import) in the C:/ directory. Otherwise, the test will fail due to missing file access.
