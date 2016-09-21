require 'spec_helper'

describe Contactually::Buckets do
  describe '#model' do
    it 'returns the Bucket class' do
      expect(described_class.new.model).to eq(Contactually::Models::Bucket)
    end
  end

  describe '.implements' do
    it 'implements list endpoint functionality' do
      client = Contactually::Client.new
      stub_request(:get, 'https://api.contactually.com/v2/buckets').
        to_return(body: MockResponses::Buckets.list_response, headers: {'Content-Type' => 'application/json'})

      response = client.buckets.list

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Buckets.list_response))
      expect(response.data).to be_a(Contactually::Collection)
    end

    it 'implements fetch endpoint functionality' do
      client = Contactually::Client.new
      stub_request(:get, 'https://api.contactually.com/v2/buckets/1').
        to_return(body: MockResponses::Buckets.fetch_response, headers: {'Content-Type' => 'application/json'})

      response = client.buckets.fetch(1)

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Buckets.fetch_response))
      expect(response.data).to be_a(Contactually::Models::Bucket)
    end
  end
end
