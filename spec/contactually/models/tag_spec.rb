require 'spec_helper'

describe Contactually::Models::Tag do
  describe 'schema' do
    it 'instantiates a tag from a response hash' do
      tag = described_class.new(MockResponses::Tags.list_data.first)

      expect(tag.contact_count).to eq(0)
      expect(tag.created_at).to eq(DateTime.parse('2016-08-26 14:37:12 UTC'))
      expect(tag.id).to eq('tag_40')
      expect(tag.name).to eq('Multi-lateral grid-enabled benchmark')
      expect(tag.updated_at).to eq(DateTime.parse('2016-08-26 14:37:12 UTC'))
    end
  end

  it_behaves_like 'a model'
end
