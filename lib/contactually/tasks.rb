module Contactually
  class Tasks < Base
    implements :fetch, :update

    def initialize(url: '/v2/tasks', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      Models::Task
    end
  end
end
