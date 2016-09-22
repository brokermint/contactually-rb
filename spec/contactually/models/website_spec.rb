require 'spec_helper'

describe Contactually::Models::Website do
  describe 'schema' do
    it 'instantiates a website from a response hash' do
      tag = described_class.new(MockResponses::Contacts.fetch_data['websites'].first)

      expect(tag.id).to eq('dc586325-d569-46c5-b19a-e7b7f8cfa80e')
      expect(tag.label).to eq('Business')
      expect(tag.address).to eq('http://google.co.uk')
    end
  end

  it_behaves_like 'a model'
end
