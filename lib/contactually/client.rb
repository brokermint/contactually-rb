require 'memoist'

module Contactually
  class Client
    extend Memoist

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
      Contactually::Buckets.new(interface: interface)
    end
    memoize :buckets

    def contacts
      Contactually::Contacts.new(interface: interface)
    end
    memoize :contacts

    def pipelines
      Contactually::Pipelines.new(interface: interface)
    end
    memoize :pipelines

    def pipeline_deals(pipeline_id = nil)
      raise StandardError, 'The `pipeline_id` should be specified' unless pipeline_id
      Contactually::PipelineDeals.new(url: "/v2/pipelines/#{pipeline_id}/deals", interface: interface)
    end
    memoize :pipeline_deals

    def contact_deals(contact_id = nil)
      raise StandardError, 'The `contact_id` should be specified' unless contact_id
      Contactually::ContactDeals.new(url: "/v2/pipelines/#{contact_id}/deals", interface: interface)
    end
    memoize :contact_deals

    def interactions
      @interactions ||= Contactually::Interactions.new(interface: interface)
    end

    def me
      @me ||= Contactually::Me.new(interface: interface)
    end

    def tags
      @tags ||= Contactually::Tags.new(interface: interface)
    end

    def tasks
      @tasks ||= Contactually::Tasks.new(interface: interface)
    end
  end
end
