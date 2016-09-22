require 'spec_helper'

describe Contactually::Middleware::ErrorHandler do
  describe '#call' do
    let(:fake_url) { 'https://api.contactually.com/irrelevant' }
    let(:generic_error_regex) { /Something went wrong/ }

    context 'any handled error' do
      it 'raises with a specific error when body is not parseable' do
        client = build_client

        stub_request(:get, fake_url).
          to_return(body: '', status: 401, headers: {'Content-Type' => 'application/json'})

        expect {
          client.interface.get(fake_url, {})
        }.to raise_error(Contactually::UnauthorizedError, generic_error_regex)
      end

      it 'raises with a generic error when content-type is not a parseable type' do
        client = build_client
        body = "{\"errors\":[\"Must supply a valid Bearer token.\"]}"

        stub_request(:get, fake_url).
          to_return(body: body, status: 401, headers: {'Content-Type' => 'application/not-json'})

        expect {
          client.interface.get(fake_url, {})
        }.to raise_error(Contactually::UnauthorizedError, generic_error_regex)
      end
    end

    context 'when a 401' do
      it 'raises a UnauthorizedError' do
        client = build_client
        body = "{\"errors\":[\"Must supply a valid Bearer token.\"]}"

        stub_request(:get, fake_url).
          to_return(body: body, status: 401, headers: {'Content-Type' => 'application/json'})

        expect {
          client.interface.get(fake_url, {})
        }.to raise_error(Contactually::UnauthorizedError, /Must supply a valid Bearer token/)
      end
    end

    context 'when a 403' do
      it 'raises a UnauthorizedError' do
        client = build_client
        body = "{\"errors\":[\"User not allowed to perform this action.\"]}"

        stub_request(:get, fake_url).
          to_return(body: body, status: 403, headers: {'Content-Type' => 'application/json'})

        expect {
          client.interface.get(fake_url, {})
        }.to raise_error(Contactually::ForbiddenError, /User not allowed to perform this action/)
      end
    end

    context 'when a 404' do
      it 'raises a NotFoundError' do
        client = build_client
        body = "{\"errors\":[\"Couldn't find Contact with\"]}"

        stub_request(:get, fake_url).
          to_return(body: body, status: 404, headers: {'Content-Type' => 'application/json'})

        expect {
          client.interface.get(fake_url, {})
        }.to raise_error(Contactually::NotFoundError, /Couldn't find Contact/)
      end
    end
  end
end
