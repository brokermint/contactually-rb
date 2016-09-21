module Contactually
  class Response
    attr_reader :model_type, :raw_response, :interface

    def initialize(response, resource)
      @raw_response = response
      @model_type = resource.model
      @interface = resource.interface
    end

    def data
      @data ||= begin
        if is_a_collection?
          collection = raw_data.map { |item| build_from_model_type(item) }

          Collection.new(collection, meta: meta)
        else
          build_from_model_type(raw_data)
        end
      end
    end

    def raw_data
      raw_response.body.fetch(DATA_KEY, {})
    end

    def errors
      raw_response.body.fetch(ERROR_KEY, {})
    end

    def meta
      raw_response.body.fetch(META_KEY, {})
    end

    private

    DATA_KEY = 'data'.freeze
    ERROR_KEY = 'errors'.freeze
    META_KEY = 'meta'.freeze

    def build_from_model_type(item)
      model_type.new(item)
    end

    def is_a_collection?
      raw_data.is_a?(Array)
    end
  end
end
