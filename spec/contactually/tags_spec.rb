require 'spec_helper'

describe Contactually::Tags do
  describe '#model' do
    it 'returns the Contact class' do
      expect(described_class.new.model).to eq(Contactually::Models::Tag)
    end
  end

  describe '.implements' do
    it 'implements list endpoint functionality' do
      client = build_client
      stub_request(:get, 'https://api.contactually.com/v2/tags').
          to_return(body: MockResponses::Tags.list_response, headers: {'Content-Type' => 'application/json'})

      response = client.tags.list

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Tags.list_response))
      expect(response.data).to be_a(Contactually::Collection)
      expect(response.data.first).to be_a(Contactually::Models::Tag)
    end
  end
end
