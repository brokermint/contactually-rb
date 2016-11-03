require 'spec_helper'

describe Contactually::Tags do
  describe '#model' do
    it 'returns the Tag class' do
      expect(described_class.new.model).to eq(Contactually::Models::Tag)
    end
  end

  describe '.implements' do
    it 'implements list endpoint functionality' do
      client = build_client
      stub_request(:get, 'https://api.contactually.com/v2/tags').
          to_return(body: MockResponses::Tags.list_response, headers: {'Content-Type' => 'application/json'})

      tags = client.tags.list

      expect(client.tags.response.body).to eq(JSON.parse(MockResponses::Tags.list_response))
      expect(tags).to be_a(Contactually::Collection)
      expect(tags.first).to be_a(Contactually::Models::Tag)
    end
  end
end
