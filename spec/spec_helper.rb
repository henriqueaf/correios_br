# frozen_string_literal: true

require 'bundler/setup'
require 'correios_br'
require 'byebug'
require 'vcr'
require 'coveralls'

Coveralls.wear!

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include ViacepHelper

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.configure do |config|
  config.default_cassette_options = { :match_requests_on => [:uri, :method, :body] }
  config.cassette_library_dir = 'spec/fixtures/vcr'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  # config.before_record do |i|
  #   i.response.body.force_encoding('UTF-8')
  # end
end
