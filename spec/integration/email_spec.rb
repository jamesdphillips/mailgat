require "spec_helper"
require "./lib/mailgat"

RSpec.describe Mailgat::Email, helpers: :vcr do
  let(:email) { "james@metalab.co" }
  let(:resource) { Mailgat::Email.new(email) }

  before do
    configure_client
  end

  describe "#valid?" do
    subject { resource.valid? }

    it "returns true" do
      is_expected.to be_truthy
    end

    context "invalid email" do
      let(:email) { "so-horribly;wrong!" }

      it "returns false" do
        is_expected.to be_falsey
      end
    end
  end

  describe "#suggestion" do
    subject { resource.suggestion }

    context "given valid address" do
      it "should return nil" do
        is_expected.to be_nil
      end
    end

    context "given invalid address" do
      let(:email) { "jamesdphillips@;gmail.com" }

      it "should include a suggestion" do
        is_expected.to be_a(String)
      end
    end
  end
end
