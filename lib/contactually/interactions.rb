module Contactually
  class Interactions < Base
    implements :create, :fetch, :update

    def initialize(url: '/v2/interactions', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      Models::Interaction
    end
  end
end
