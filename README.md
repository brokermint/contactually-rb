# contactually-rb

[![Build Status](https://travis-ci.org/RealScout/contactually-ruby.svg?branch=master)](https://travis-ci.org/RealScout/contactually-ruby)
[![Code Climate](https://codeclimate.com/github/RealScout/contactually-ruby/badges/gpa.svg)](https://codeclimate.com/github/RealScout/contactually-ruby)
[![Test Coverage](https://codeclimate.com/github/RealScout/contactually-ruby/badges/coverage.svg)](https://codeclimate.com/github/RealScout/contactually-ruby)

A simple ruby wrapper around [Contactually v2 Api](https://developers.contactually.com/docs/v2/).

__NOTE__: This is a heavily work in progress codebase, and will most definitely have breaking changes as things progress.

## Installation

Gemfile

```
gem 'contactually-rb', '~> 0.1.0'
```

System

```
gem install contactually-rb
```

## Usage

Simple list contacts example,

```ruby
require 'contactually'

client = Contactually::Client.new(auth_token: '<auth_token>')
#   or
client = Contactually::Client.new(api_key: '<api_key>')

response = client.contacts.list
# => #<Contactually::Response>

response.data
# => #<Contactually::Collection>

response.data.total # => 73
response.raw_response # => #<Faraday::Response>

data = response.data
contact = data.first # => #<Contactually::Models::Contact>
contact.first_name # => "Nic"

```

Loop through all contacts (it will yield contact and transparently loop through all contacts in batches of 50 using Contacutally pagination),

```ruby
client = Contactually::Client.new(auth_token: '<auth_token>')

client.contacts.list_each do |contact|
  # do something with contact
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/contactually-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Todos

- Support update endpoints
- Support Contact convenience endpoints (eg: /contacts/:id/notes)
- Support Create, Destroy endpoints
- Support other endpoints
