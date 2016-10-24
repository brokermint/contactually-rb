module Contactually
  class Me < Base
    implements :fetch, :update

    def initialize(url: '/v2/me', interface: nil)
      @url = url
      @interface = interface
    end

    def fetch
      super(nil)
    end

    def update(body)
      super(nil, body)
    end

    def model
      Models::User
    end
  end
end
