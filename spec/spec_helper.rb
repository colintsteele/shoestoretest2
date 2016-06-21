require 'pry'
require 'spec_helper'
require 'watir-webdriver'
require_relative '../lib/home'
require_relative '../lib/month'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
