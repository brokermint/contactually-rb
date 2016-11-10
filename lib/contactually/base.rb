module Contactually
  class Base
    attr_reader :url, :interface, :response

    def self.implements(*method_list)
      @implements = method_list
    end

    def self.implement_list
      @implements
    end

    def initialize(url:, interface:)
      @url = url
      @interface = interface
    end

    def list(params = {})
      check_implementation(:list)
      wrap_response(interface.get(url, params)).data
    end

    def list_each(params = {}, &block)
      check_implementation(:list)

      if block_given?
        list_in_batches(params) do |items|
          items.each do |item|
            block.call(item)
          end
        end
      else
        enum_for :list_each, params
      end
    end

    def create(body)
      check_implementation(:create)
      wrap_response(interface.post(build_fetch_url, body)).data
    end

    def fetch(id, params = {})
      check_implementation(:fetch)
      wrap_response(interface.get(build_fetch_url(id), params)).data
    end

    def update(id, body)
      check_implementation(:update)
      wrap_response(interface.patch(build_fetch_url(id), body)).data
    end

    def destroy(id)
      check_implementation(:destroy)
      wrap_response(interface.destroy(build_fetch_url(id))).data
    end

    def check_implementation(method)
      raise 'Error' unless self.class.implement_list.include?(method)
    end

    def model
      OpenStruct
    end

    private

    def build_fetch_url(id = nil)
      if id
        url + "/" + id.to_s
      else
        url
      end
    end

    def list_in_batches(params)
      collection = wrap_response(interface.get(url, params)).data
      return unless collection.total > 0

      while collection.items.any?
        yield collection

        break unless collection.has_next_page?

        url = collection.next_page
        _old_page = params.delete(:page)

        collection = wrap_response(interface.get(url, params)).data
      end
    end

    def wrap_response(raw_response)
      @response = Response.new(raw_response, self)
    end
  end
end
