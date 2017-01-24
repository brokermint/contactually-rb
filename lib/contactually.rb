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

  class Error < StandardError
    attr_reader :messages

    def initialize(messages)
      @messages = messages
      super(messages.join(','))
    end
  end

  class ForbiddenError < Error
  end

  class NotFoundError < Error
  end

  class PaymentRequiredError < Error
  end

  class UnauthorizedError < Error
  end

  class TypeMismatchError < Error
  end
end

require 'contactually/models/model'
require 'contactually/middleware/error_middleware'

require 'contactually/models/address'
require 'contactually/models/bucket'
require 'contactually/models/email_address'
require 'contactually/models/participant'
require 'contactually/models/phone_number'
require 'contactually/models/social_media_profile'
require 'contactually/models/tag'
require 'contactually/models/website'
require 'contactually/models/contact'
require 'contactually/models/interaction'
require 'contactually/models/task'
require 'contactually/models/user'

require 'contactually/client'
require 'contactually/base'
require 'contactually/buckets'
require 'contactually/collection'
require 'contactually/contacts'
require 'contactually/interactions'
require 'contactually/interface'
require 'contactually/me'
require 'contactually/response'
require 'contactually/tags'
require 'contactually/tasks'
