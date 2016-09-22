require 'spec_helper'

describe Contactually::Models::Contact do
  describe 'schema' do
    it 'instantiates a contact from a response hash' do
      contact = build_contact

      expect(contact.avatar_url).to eq('http://placekitten.com/200/300')
      expect(contact.company).to eq('Awesome Inc.')
      expect(contact.created_at).to eq(DateTime.parse('2016-08-26 14:37:11 UTC'))
      expect(contact.first_name).to eq('Wilford')
      expect(contact.id).to eq('contact_31')
      expect(contact.last_name).to eq('Wilderman')
      expect(contact.tags).to eq(['tag 1', 'tag 2'])
      expect(contact.title).to eq('Operations Director')
      expect(contact.updated_at).to eq(DateTime.parse('2016-08-26 14:37:11 UTC'))
    end

    it 'supports extra data with no defined schema' do
      contact = build_contact
      expected_hash = {
        'last_contacted' => nil,
        'muted_at' => nil,
        'relationship_status' => 'none',
        'team_last_contacted_at' => nil,
        'team_last_contacted_by_id' => nil,
        'followup_source' => nil,
        'buckets' => [
          {
              'id' => 'bucket_38',
              'name' => 'User-centric attitude-oriented function'
          },
          {
              'id' => 'bucket_39',
              'name' => 'Horizontal leading edge attitude'
          }
        ]
      }

      expect(contact.extra_data).to eq(expected_hash)
    end

    it 'has many addresses' do
      contact = build_contact

      expect(contact.addresses).to be_a(Array)
      expect(contact.addresses.first).to be_a(Contactually::Models::Address)
    end

    it 'has many email addresses' do
      contact = build_contact

      expect(contact.email_addresses).to be_a(Array)
      expect(contact.email_addresses.first).to be_a(Contactually::Models::EmailAddress)
    end

    it 'has many phone numbers' do
      contact = build_contact

      expect(contact.phone_numbers).to be_a(Array)
      expect(contact.phone_numbers.first).to be_a(Contactually::Models::PhoneNumber)
    end

    it 'has many tags' do
      contact = build_contact

      expect(contact.tags).to be_a(Array)
      expect(contact.tags.first).to be_a(String)
    end

    it 'has many websites' do
      contact = build_contact

      expect(contact.websites).to be_a(Array)
      expect(contact.websites.first).to be_a(Contactually::Models::Website)
    end
  end

  it_behaves_like 'a model'

  def build_contact
    Contactually::Models::Contact.new(MockResponses::Contacts.fetch_data)
  end
end
