module Contactually
  module Middleware
    class ErrorHandler < Faraday::Middleware
      def call(env)
        @app.call(env).on_complete do |env|
          case env.status
            when 401
              # Missing or invalid auth token
              raise Contactually::UnauthorizedError.new(error_messages(env.response))
            when 402
              # Auth token could be invalid due to non-payment
              raise Contactually::PaymentRequiredError.new(error_messages(env.response))
            when 403
              # App does not have permission to perform the operation
              raise Contactually::ForbiddenError.new(error_messages(env.response))
            when 404
              # Standard REST resource not found or not allowed to fetch
              raise Contactually::NotFoundError.new(error_messages(env.response))
          end
        end
      end

      private

      def error_messages(response)
        return generic_error unless is_json?(response)

        body = parse_body(response)

        if body.has_key?('errors')
          case body['errors']
            when Array
              body['errors']
            else
              # Sometimes Contactually returns an errors key with a nested object instead of a list of errors
              [body['errors'].to_s]
          end
        else
          generic_error
        end
      end

      def generic_error
        ['Something went wrong']
      end

      def is_json?(response)
        response.headers['content-type'] =~ /application\/json/i
      end

      def parse_body(response)
        JSON.parse(response.body) rescue {}
      end
    end
  end
end
