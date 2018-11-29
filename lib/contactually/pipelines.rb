module Contactually
  class Pipelines < Base
    implements :create, :list, :fetch, :update, :destroy

    def initialize(url: '/v2/pipelines', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      Models::Pipeline
    end
  end
end
