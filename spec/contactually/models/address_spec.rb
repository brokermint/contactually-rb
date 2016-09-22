require 'spec_helper'

describe Contactually::Models::Address do
  describe 'schema' do
    it 'instantiates a address from a response hash' do
      address = described_class.new(MockResponses::Contacts.fetch_data['addresses'].first)

      expect(address.city).to eq('Sunnyvale')
      expect(address.country).to eq('USA')
      expect(address.id).to eq('ab0006d1-89d0-4991-854a-a9cb7957d091')
      expect(address.full_address).to eq('480 Ellis St')
      expect(address.label).to eq('Office')
      expect(address.state).to eq('CA')
      expect(address.street_1).to eq('street 1')
      expect(address.street_2).to eq('street 2')
      expect(address.zip).to eq('94086')
    end
  end

  it_behaves_like 'a model'
end
