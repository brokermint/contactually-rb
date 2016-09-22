require 'spec_helper'

describe Contactually::Me do
  describe '#model' do
    it 'returns the User class' do
      expect(described_class.new.model).to eq(Contactually::Models::User)
    end
  end

  describe '.implements' do
    it 'implements fetch endpoint functionality' do
      client = build_client
      stub_request(:get, 'https://api.contactually.com/v2/me').
        to_return(body: MockResponses::Users.fetch_response, headers: {'Content-Type' => 'application/json'})

      response = client.me.fetch

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Users.fetch_response))
      expect(response.data).to be_a(Contactually::Models::User)
    end
  end
end
