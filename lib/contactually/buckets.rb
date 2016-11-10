module Contactually
  class Buckets < Base
    implements :create, :fetch, :list, :update, :destroy

    def initialize(url: '/v2/buckets', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      Models::Bucket
    end
  end
end
