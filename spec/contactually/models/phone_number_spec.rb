require 'spec_helper'

describe Contactually::Models::PhoneNumber do
  describe 'schema' do
    it 'instantiates a phone number from a response hash' do
      tag = described_class.new(MockResponses::Contacts.fetch_data['phone_numbers'].first)

      expect(tag.id).to eq('92f19ed2-0cde-4b48-ab75-f95ed316d143')
      expect(tag.label).to eq('Home')
      expect(tag.number).to eq('(692)717-4331')
    end
  end

  it_behaves_like 'a model'
end
