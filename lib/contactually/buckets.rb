module Contactually
  class Buckets < Base
    implements :list, :fetch

    def initialize(url: '/v2/buckets', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      Models::Bucket
    end
  end
end
