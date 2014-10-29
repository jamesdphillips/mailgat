module Mailgat
  class Email < Resource

    # @param email [String] address
    def initialize(email)
      @email = email
      super()
    end

    # Determine whether or not the address appears valid
    #
    # @see http://documentation.mailgun.com/api-email-validation.html#email-validation
    # @return [Boolean]
    def valid?
      response = validate
      !!response.is_valid
    end

    # If invalid w/ suspected typo, returns suggestion
    #
    # @see http://documentation.mailgun.com/api-email-validation.html#email-validation
    # @return [String]
    def suggestion
      response = validate
      response.did_you_mean
    end

    private

    def validate
      @validation ||= get("address/validate", {address: @email}, Mailgat.client_auth_header).body
    end
  end
end
