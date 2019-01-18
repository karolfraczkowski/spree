require 'bundler'
require 'capybara/rspec'
require 'selenium/webdriver'
Bundler.require
require 'capybara/dsl'
require 'rspec/expectations'

# Adding helpers to all Specs
Dir['./spec/helpers/**/*.rb'].each { |file| require file }
Dir['./spec/shared_examples/**/*.rb'].each { |file| require file }

# New driver for Chrome browser
Capybara.register_driver :chrome do |app|
  prefs = { 'profile.managed_default_content_settings.notifications' => 2 }
  options = %w[incognito start-maximized disable-notifications]

  # Actual creating of the new driver
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: Selenium::WebDriver::Chrome::Options.new(args: options, prefs: prefs))
end
# New driver for Firefox browser
Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.register_driver :safari do |app|
  Capybara::Selenium::Driver.new(app, browser: :safari)
end

# Default settings for project
# -don't use rails server
# -Use Chrome as default
# -Set up staging environment as default
Capybara.default_driver = :chrome

Capybara.app_host = 'https://karol-spree.herokuapp.com'

Capybara.run_server = false

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include MainHelper

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
