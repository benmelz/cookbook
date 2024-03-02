# frozen_string_literal: true

require "spec_helper"

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
abort("The Rails environment is running in production mode!") if Rails.env.production?
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

require "capybara"
require "paper_trail/frameworks/rspec"
require "rspec/rails"
require "selenium-webdriver"
require "shoulda-matchers"

RSpec.configure do |config|
  config.filter_rails_from_backtrace!
  config.fixture_paths = [Rails.root.join("spec/fixtures")]
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true

  config.include FactoryBot::Syntax::Methods

  config.before :each, type: :system do
    driven_by :selenium_headless
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
