# contactually-rb

[![Build Status](https://travis-ci.org/RealScout/contactually-rb.svg?branch=master)](https://travis-ci.org/RealScout/contactually-rb)
[![Code Climate](https://codeclimate.com/github/RealScout/contactually-rb/badges/gpa.svg)](https://codeclimate.com/github/RealScout/contactually-rb)
[![Test Coverage](https://codeclimate.com/github/RealScout/contactually-rb/badges/coverage.svg)](https://codeclimate.com/github/RealScout/contactually-rb)

A simple ruby wrapper around [Contactually v2 Api](https://developers.contactually.com/docs/v2/).

__NOTE__: This is a heavily work in progress codebase, and will most definitely have breaking changes as things progress.

## Installation

Gemfile

```
gem 'contactually-rb', '~> 0.1.1'
```

System

```
gem install contactually-rb
```

## Usage

### Simple list contacts example

Create a client instance

```ruby
require 'contactually'

client = Contactually::Client.new(auth_token: '<auth_token>')
#   or
client = Contactually::Client.new(api_key: '<api_key>')
```

```ruby
# List contacts
contacts = client.contacts.list
# => #<Contactually::Collection>

# Access to response wrapper
client.contacts.response
# => #<Contactually::Response>

# Raw farday response
client.contacts.response.raw_response
# => #<Faraday::Response>

contacts.total # => 73 Total contact count
contacts.size # => 50 Total contacts in current list

contact = contacts.first # => #<Contactually::Models::Contact>
contact.first_name # => "Nic"
```

Looping through all contacts (it will yield contact and transparently loop through all contacts in batches of 50 using Contacutally pagination),

```ruby
client = Contactually::Client.new(auth_token: '<auth_token>')

client.contacts.list_each do |contact|
  # do something with contact, 50 per batch as specified by Contactually API
end
```

### Searching

```ruby
collection = client.contacts.list({q: 'Nic'})
collection.first.name # => Nic
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RealScout/contactually-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Todos

- ~~Support update endpoints~~
- Support Contact convenience endpoints (eg: /contacts/:id/notes)
- Support ~~Create~~, Destroy endpoints
- Support other endpoints
- Better client testing support (`Contactually.configuration.test_mode = true`)
- Documentation
