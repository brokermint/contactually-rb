module Contactually
  class Pipelines < Base
    implements :create, :fetch, :update, :advance, :regress

    def initialize(url: '/v2/deals', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      Models::Pipeline
    end

    def advance(id, body)
      check_implementation(:advance)
      Response.new(interface.post(build_fetch_url(id, 'advance'), body), self)
    end

    def regress(id, body)
      check_implementation(:regress)
      Response.new(interface.post(build_fetch_url(id, 'regress'), body), self)
    end
  end
end
