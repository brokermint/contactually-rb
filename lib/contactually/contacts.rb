module Contactually
  class Contacts < Base
    implements :create, :list, :fetch, :update, :destroy

    def initialize(url: '/v2/contacts', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      Models::Contact
    end
  end
end
