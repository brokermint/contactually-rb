require 'date'
require 'forwardable'

require 'faraday'
require 'faraday_middleware'

require 'contactually/version'

module Contactually
  class << self
    attr_accessor :configuration
  end

  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  class Configuration
    attr_accessor :adapter

    def initialize
      @adapter = Faraday.default_adapter
    end
  end
end

require 'contactually/models/model'

require 'contactually/models/address'
require 'contactually/models/bucket'
require 'contactually/models/email_address'
require 'contactually/models/phone_number'
require 'contactually/models/social_media_profile'
require 'contactually/models/tag'
require 'contactually/models/website'
require 'contactually/models/contact'
require 'contactually/models/task'

require 'contactually/client'
require 'contactually/base'
require 'contactually/buckets'
require 'contactually/collection'
require 'contactually/contacts'
require 'contactually/interface'
require 'contactually/response'
require 'contactually/tags'
require 'contactually/tasks'
