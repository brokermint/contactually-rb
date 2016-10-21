module Contactually
  class Buckets < Base
    implements :list, :fetch, :update

    def initialize(url: '/v2/buckets', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      Models::Bucket
    end
  end
end
