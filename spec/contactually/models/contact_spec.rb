require 'spec_helper'

describe Contactually::Models::Contact do
  describe 'schema' do
    it 'instantiates a contact from a response hash' do
      contact = described_class.new(MockResponses::Contacts.fetch_data)

      expect(contact.avatar_url).to eq('http://placekitten.com/200/300')
      expect(contact.company).to eq('Awesome Inc.')
      expect(contact.created_at).to eq(DateTime.parse('2016-08-26 14:37:11 UTC'))
      expect(contact.first_name).to eq('Wilford')
      expect(contact.id).to eq('contact_31')
      expect(contact.last_name).to eq('Wilderman')
      expect(contact.tags).to eq(['tag 1', 'tag 2'])
      expect(contact.title).to eq('Operations Director')
      expect(contact.updated_at).to eq(DateTime.parse('2016-08-26 14:37:11 UTC'))
      expect(contact.extra_data).to eq({
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
      })
    end

    it 'has many addresses' do
      contact = described_class.new(MockResponses::Contacts.fetch_data)

      expect(contact.addresses).to be_a(Array)
      expect(contact.addresses.first).to be_a(Contactually::Models::Address)
    end

  end

  it_behaves_like 'a model'
end
