module Contactually
  module Middleware
    class ErrorHandler < Faraday::Middleware
      def call(env)
        @app.call(env).on_complete do |env|
          case env.status
            when 401
              # Missing or invalid auth token
              raise Contactually::UnauthorizedError.new(error_messages(env.response))
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
          body['errors']
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
