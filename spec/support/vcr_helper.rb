require "vcr"
require "webmock"
require "active_support/concern"
require "active_support/core_ext/string/inflections"

module VCRHelper
  extend ActiveSupport::Concern

  VCR.configure do |config|
    config.cassette_library_dir = "spec/cassettes"
    config.hook_into :webmock
    config.configure_rspec_metadata!
    config.filter_sensitive_data("APIKEY") { ENV["MAILGUN_KEY"] }
    config.filter_sensitive_data("PUBLICKEY") { ENV["MAILGUN_PUBLIC_KEY"] }
  end

  included do
    around(:each) do |example|
      cassette_name = defined?(cassette) ? cassette : self.class.name.tableize
      VCR.use_cassette(cassette_name, record: :new_episodes, match_requests_on: [:path]) do
        example.run
      end
    end
  end
end
