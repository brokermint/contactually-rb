module Contactually
  class Tags < Base
    implements :list

    def initialize(url: '/v2/tags', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      Models::Tag
    end
  end
end
