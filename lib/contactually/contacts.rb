module Contactually
  class Contacts < Base
    implements :list, :fetch

    def initialize(url: '/v2/contacts', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      Models::Contact
    end
  end
end
