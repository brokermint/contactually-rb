module Contactually
  class Me < Base
    implements :fetch

    def initialize(url: '/v2/me', interface: nil)
      @url = url
      @interface = interface
    end

    def fetch
      super(nil)
    end

    def model
      Models::User
    end
  end
end
