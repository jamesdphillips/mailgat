require "faraday"
require "faraday_middleware"
require "hashie/mash"

require "mailgat/resource"
require "mailgat/email"
require "mailgat/version"

module Mailgat
  class << self
    attr_writer :client
    attr_reader :configuration
  end

  # Configure client
  #
  # @yield [configuration] configuration object to defining client paramters
  # @example
  #   Mailgat.configure do |config|
  #     config.api_key = "XYZ"
  #     config.adapter = :typhoeus
  #   end
  def self.configure(&block)
    @configuration ||= Configuration.new
    yield(@configuration) if block_given?

    self.client = Faraday.new(@configuration.api_base) do |connection|
      connection.basic_auth "api", @configuration.api_key
      connection.request :url_encoded
      connection.response :logger
      connection.response :mashify
      connection.response :json, content_type: /\bjson$/
      connection.adapter @configuration.adapter
    end
  end

  def self.client
    @client || configure
  end

  def self.client_auth_header
    { "Authorization" =>
        "Basic #{ Base64.encode64(["api", configuration.public_key].join(":")).gsub!("\n", "") }" }
  end

  class Configuration
    attr_accessor :api_base, :api_key, :public_key, :adapter

    def initialize
      @api_base = "https://api.mailgun.net/v2"
      @api_key = ENV["MAILGUN_API_KEY"]
      @public_key = ENV["MAILGUN_PUBLIC_KEY"]
      @adapter = Faraday.default_adapter
    end
  end
end
