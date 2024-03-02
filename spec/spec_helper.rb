# frozen_string_literal: true

require "simplecov"

SimpleCov.start "rails" do
  enable_coverage :branch
  minimum_coverage line: 100, branch: 100
end

RSpec.configure do |config|
  Kernel.srand config.seed

  config.default_formatter = "doc" if config.files_to_run.one?
  config.example_status_persistence_file_path = "spec/examples.txt"
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.filter_run_when_matching :focus
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.order = :random
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
