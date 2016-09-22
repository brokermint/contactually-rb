require 'spec_helper'

describe Contactually::Contacts do
  describe '#model' do
    it 'returns the Contact class' do
      expect(described_class.new.model).to eq(Contactually::Models::Contact)
    end
  end

  describe '.implements' do
    it 'implements list endpoint functionality' do
      client = build_client
      stub_request(:get, 'https://api.contactually.com/v2/contacts').
          to_return(body: MockResponses::Contacts.list_response, headers: {'Content-Type' => 'application/json'})

      response = client.contacts.list

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Contacts.list_response))
      expect(response.data).to be_a(Contactually::Collection)
      expect(response.data.first).to be_a(Contactually::Models::Contact)
    end

    it 'implements fetch endpoint functionality' do
      client = build_client
      stub_request(:get, 'https://api.contactually.com/v2/contacts/contact_1').
          to_return(body: MockResponses::Contacts.fetch_response, headers: {'Content-Type' => 'application/json'})

      response = client.contacts.fetch('contact_1')

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Contacts.fetch_response))
      expect(response.data).to be_a(Contactually::Models::Contact)
    end
  end
end
