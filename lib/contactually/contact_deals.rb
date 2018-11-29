module Contactually
  class ContactDeals < Base
    implements :list

    def initialize(url: '/v2/contacts/:contact_id/deals', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      Models::Deal
    end
  end
end
