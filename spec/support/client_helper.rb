module ClientHelper
  def configure_client
    Mailgat.configure do |config|
      config.api_key = ENV["MAILGUN_API_KEY"]
      config.public_key = ENV["MAILGUN_PUBLIC_KEY"]
      yield(config) if block_given?
    end
  end
end
