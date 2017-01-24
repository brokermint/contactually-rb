require 'spec_helper'

describe Contactually::Interactions do
  describe '#model' do
    it 'returns the Interaction class' do
      expect(described_class.new.model).to eq(Contactually::Models::Interaction)
    end
  end

  describe '.implements' do
    it 'implements create endpoint functionality' do
      client = build_client
      stub_request(:post, 'https://api.contactually.com/v2/interactions').
        to_return(body: MockResponses::Interactions.create_response, headers: {'Content-Type' => 'application/json'})

      response = client.interactions.create({data: {subject: 'test'}})

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Interactions.create_response))
      expect(response.data).to be_a(Contactually::Models::Interaction)
    end

    it 'implements fetch endpoint functionality' do
      client = build_client
      stub_request(:get, 'https://api.contactually.com/v2/interactions/interaction_1').
        to_return(body: MockResponses::Interactions.fetch_response, headers: {'Content-Type' => 'application/json'})

      response = client.interactions.fetch('interaction_1')

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Interactions.fetch_response))
      expect(response.data).to be_a(Contactually::Models::Interaction)
    end

    it 'implements update endpoint functionality' do
      client = build_client
      stub_request(:patch, 'https://api.contactually.com/v2/interactions/interaction_1').
        to_return(body: MockResponses::Interactions.update_response, headers: {'Content-Type' => 'application/json'})

      response = client.interactions.update('interaction_1', {})

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Interactions.update_response))
      expect(response.data).to be_a(Contactually::Models::Interaction)
    end

    it 'implements delete endpoint functionality' do
      client = build_client
      stub_request(:delete, 'https://api.contactually.com/v2/interactions/interaction_1').
          to_return(body: MockResponses::Interactions.fetch_response, headers: {'Content-Type' => 'application/json'})

      response = client.interactions.destroy('interaction_1')

      expect(response.status).to eq(200)
    end
  end
end
