module Contactually
  class Base
    attr_reader :url, :interface

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
      Response.new(interface.get(url, params), self)
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

    def create
      check_implementation(:create)
    end

    def fetch(id, params = {})
      check_implementation(:fetch)
      Response.new(interface.get(build_fetch_url(id), params), self)
    end

    def update(id, body)
      check_implementation(:update)
      Response.new(interface.patch(build_fetch_url(id), body), self)
    end

    def delete
      check_implementation(:delete)
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
      collection = Response.new(interface.get(url, params), self).data
      return unless collection.total > 0

      while collection.items.any?
        yield collection

        break unless collection.has_next_page?

        url = collection.next_page
        _old_page = params.delete(:page)

        collection = Response.new(interface.get(url, params), self).data
      end
    end
  end
end
