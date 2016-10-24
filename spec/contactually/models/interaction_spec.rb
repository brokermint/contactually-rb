require 'spec_helper'

describe Contactually::Models::Interaction do
  describe 'schema' do
    it 'instantiates an interaction from a response hash' do
      interaction = described_class.new(MockResponses::Interactions.fetch_data)

      expect(interaction.created_at).to eq(DateTime.parse('2016-09-28 15:17:23 UTC'))
      expect(interaction.id).to eq('interaction_10257')
      expect(interaction.initiated_by_contact).to eq(true)
      expect(interaction.participants.map{|p| p.contact_id}).to eq(['contact_2313', 'contact_2314', 'contact_2315'])
      expect(interaction.subject).to eq('Fundamental full-range time-frame')
      expect(interaction.type).to eq('email')
    end
  end

  it_behaves_like 'a model'
end
