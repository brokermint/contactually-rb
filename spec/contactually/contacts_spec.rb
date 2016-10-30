require 'spec_helper'

describe Contactually::Contacts do
  describe '#model' do
    it 'returns the Contact class' do
      expect(described_class.new.model).to eq(Contactually::Models::Contact)
    end
  end

  describe '.implements' do
    it 'implements create endpoint functionality' do
      client = build_client
      stub_request(:post, 'https://api.contactually.com/v2/contacts').
        to_return(body: MockResponses::Contacts.create_response, headers: {'Content-Type' => 'application/json'})

      contact = client.contacts.create({data: {first_name: 'test'}}.to_json)

      expect(client.contacts.response.body).to eq(JSON.parse(MockResponses::Contacts.create_response))
      expect(contact).to be_a(Contactually::Models::Contact)
    end

    it 'implements list endpoint functionality' do
      client = build_client
      stub_request(:get, 'https://api.contactually.com/v2/contacts').
          to_return(body: MockResponses::Contacts.list_response, headers: {'Content-Type' => 'application/json'})

      contacts = client.contacts.list

      expect(client.contacts.response.body).to eq(JSON.parse(MockResponses::Contacts.list_response))
      expect(contacts).to be_a(Contactually::Collection)
      expect(contacts.first).to be_a(Contactually::Models::Contact)
    end

    it 'implements fetch endpoint functionality' do
      client = build_client
      stub_request(:get, 'https://api.contactually.com/v2/contacts/contact_1').
          to_return(body: MockResponses::Contacts.fetch_response, headers: {'Content-Type' => 'application/json'})

      contact = client.contacts.fetch('contact_1')

      expect(client.contacts.response.body).to eq(JSON.parse(MockResponses::Contacts.fetch_response))
      expect(contact).to be_a(Contactually::Models::Contact)
    end

    it 'implements update endpoint functionality' do
      client = build_client
      stub_request(:patch, 'https://api.contactually.com/v2/contacts/contact_1').
        to_return(body: MockResponses::Contacts.update_response, headers: {'Content-Type' => 'application/json'})

      contact = client.contacts.update('contact_1', {})

      expect(client.contacts.response.body).to eq(JSON.parse(MockResponses::Contacts.update_response))
      expect(contact).to be_a(Contactually::Models::Contact)
    end
  end
end
