require 'spec_helper'

describe Contactually::Buckets do
  describe '#model' do
    it 'returns the Bucket class' do
      expect(described_class.new.model).to eq(Contactually::Models::Bucket)
    end
  end

  describe '.implements' do
    it 'implements create endpoint functionality' do
      client = build_client
      stub_request(:post, 'https://api.contactually.com/v2/buckets').
        with(body: {data: {name: 'test'}}).
        to_return(body: MockResponses::Buckets.create_response, headers: {'Content-Type' => 'application/json'})

      response = client.buckets.create({data: {name: 'test'}})

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Buckets.fetch_response))
      expect(response.data).to be_a(Contactually::Models::Bucket)
    end

    it 'implements list endpoint functionality' do
      client = build_client
      stub_request(:get, 'https://api.contactually.com/v2/buckets').
        to_return(body: MockResponses::Buckets.list_response, headers: {'Content-Type' => 'application/json'})

      response = client.buckets.list

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Buckets.list_response))
      expect(response.data).to be_a(Contactually::Collection)
      expect(response.data.first).to be_a(Contactually::Models::Bucket)
    end

    it 'implements fetch endpoint functionality' do
      client = build_client
      stub_request(:get, 'https://api.contactually.com/v2/buckets/1').
        to_return(body: MockResponses::Buckets.fetch_response, headers: {'Content-Type' => 'application/json'})

      response = client.buckets.fetch(1)

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Buckets.fetch_response))
      expect(response.data).to be_a(Contactually::Models::Bucket)
    end

    it 'implements update endpoint functionality' do
      client = build_client
      stub_request(:patch, 'https://api.contactually.com/v2/buckets/1').
        with(body: {data: {name: 'test'}}).
        to_return(body: MockResponses::Buckets.update_response, headers: {'Content-Type' => 'application/json'})

      response = client.buckets.update(1, {data: {name: 'test'}}.to_json)

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Buckets.update_response))
      expect(response.data).to be_a(Contactually::Models::Bucket)
    end

    it 'implements delete endpoint functionality' do
      client = build_client
      stub_request(:delete, 'https://api.contactually.com/v2/buckets/1').
          to_return(body: MockResponses::Buckets.fetch_response, headers: {'Content-Type' => 'application/json'})

      response = client.buckets.destroy('1')

      expect(response.status).to eq(200)
    end
  end
end
