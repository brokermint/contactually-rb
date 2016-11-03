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

      user = client.me.fetch

      expect(client.me.response.body).to eq(JSON.parse(MockResponses::Users.fetch_response))
      expect(user).to be_a(Contactually::Models::User)
    end

    it 'implements update endpoint functionality' do
      client = build_client
      stub_request(:patch, 'https://api.contactually.com/v2/me').
        to_return(body: MockResponses::Users.fetch_response, headers: {'Content-Type' => 'application/json'})

      user = client.me.update({data: {first_name: 'hi'}}.to_json)

      expect(client.me.response.body).to eq(JSON.parse(MockResponses::Users.update_response))
      expect(user).to be_a(Contactually::Models::User)
    end
  end
end
