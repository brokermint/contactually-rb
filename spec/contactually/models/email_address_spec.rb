require 'spec_helper'

describe Contactually::Models::EmailAddress do
  describe 'schema' do
    it 'instantiates a email address from a response hash' do
      tag = described_class.new(MockResponses::Contacts.fetch_data['email_addresses'].first)

      expect(tag.address).to eq('wilford.wilderman@example.com')
      expect(tag.id).to eq('contact_identity_19')
      expect(tag.label).to eq('Primary Email')
    end
  end

  it_behaves_like 'a model'
end
