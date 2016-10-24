module Contactually
  class Interface
    attr_reader :adapter, :api_key, :auth_token, :base_url, :connection, :headers

    def initialize(auth_token: nil, api_key: nil, base_url: nil)
      @auth_token = auth_token
      @api_key = api_key
      @adapter = Contactually.configuration.adapter || :net_http
      @base_url = base_url
    end

    def get(url, params)
      connection.get(build_full_url(url), params)
    end

    def patch(url, body)
      connection.patch(build_full_url(url), body)
    end

    def post(url, body)
      connection.post(build_full_url(url), body)
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.adapter  @adapter
        conn.response :json, :content_type => /\bjson$/
        conn.use Contactually::Middleware::ErrorHandler

        conn.headers['Content-type']  = 'application/json',
        conn.headers['Authorization'] = "Bearer #{token}"
      end
    end

    private

    def build_full_url(url)
      if url.downcase.start_with?('http')
        url
      else
        "#{base_url}#{url}"
      end
    end

    def token
      auth_token || api_key
    end
  end
end
