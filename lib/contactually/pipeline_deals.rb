module Contactually
  class PipelineDeals < Base
    implements :list

    def initialize(url: '/v2/pipelines/:pipeline_id/deals', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      Models::Deal
    end
  end
end
