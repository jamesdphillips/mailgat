require "active_support/core_ext/module/delegation"

module Mailgat
  class Resource
    delegate :get, :post, :patch, :put, :delete, to: :@client

    def initialize
      @client = Mailgat.client
    end
  end
end
