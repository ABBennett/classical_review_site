require 'coveralls'
require 'database_cleaner'
require 'rails_helper'
require 'shoulda-matchers'

require "bundler/setup"
::Bundler.require(:default, :test)

::Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

Coveralls.wear!('rails')

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.before :each do
    ActionMailer::Base.deliveries.clear
  end


end
