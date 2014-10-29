# Mailgat

Client wrapper for Mailgun API

[![Build Status](https://travis-ci.org/jamesdphillips/mailgat.svg)](https://travis-ci.org/jamesdphillips/mailgat) [![Coverage Status](https://coveralls.io/repos/jamesdphillips/mailgat/badge.png?branch=master)](https://coveralls.io/r/jamesdphillips/mailgat?branch=master)

## Installation

Add this line to your application's Gemfile:

    gem 'mailgat'

And then execute:

    $ bundle

## Usage

Simply configure with your API key:

```ruby
# config/initializers/mailgun.rb

Mailgat.configure do |config|
  config.api_key = "XYZ"
  config.public_key = "ABC" # optional
  config.adapter = :typoeus # optional; will default to your Faraday default adapter
end
```

The client will also try to use `ENV["MAILGUN_API_KEY"]` by default.

### Email Validation

Wraps validation endpoint. Example usage:

```
email = Mailgunner::Email.new("jason@;gmail.com")
email.valid? # => false
email.suggestion # => "jason@gmail.com"
```

## Testing

To run the tests:

```shell
$ rake spec
```

## Contributing

Pull Requests more than welcome!

1. Fork it ( https://github.com/jamesdphillips/mailgunner/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
