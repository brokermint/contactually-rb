module Contactually
  class Client
    attr_reader :interface

    def initialize(api_key: nil, auth_token: nil, base_url: 'https://api.contactually.com')
      @api_key = api_key
      @auth_token = auth_token
      @base_url = base_url
      @interface = Contactually::Interface.new(
        api_key:      @api_key,
        auth_token:   @auth_token,
        base_url:     @base_url
      )
    end

    def buckets
      @buckets ||= Contactually::Buckets.new(interface: interface)
    end

    def contacts
      @contacts ||= Contactually::Contacts.new(interface: interface)
    end

    def tags
      @tags ||= Contactually::Tags.new(interface: interface)
    end
  end
end
