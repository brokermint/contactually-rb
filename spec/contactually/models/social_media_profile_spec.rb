require 'spec_helper'

describe Contactually::Models::SocialMediaProfile do
  describe 'schema' do
    it 'instantiates a social media profile from a response hash' do
      tag = described_class.new(MockResponses::Contacts.fetch_data['social_media_profiles'].first)

      expect(tag.id).to eq('30435661-5e2f-4886-871a-b2b99d0b3afb')
      expect(tag.label).to eq('LinkedIn')
      expect(tag.url).to eq('http://google.com')
    end
  end

  it_behaves_like 'a model'
end
