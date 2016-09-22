require 'spec_helper'

describe Contactually::Models::User do
  describe 'schema' do
    it 'instantiates a user from a response hash' do
      user = described_class.new(MockResponses::Users.fetch_data)

      expect(user.avatar_url).to eq('http://placekitten.com.s3.amazonaws.com/homepage-samples/408/287.jpg')
      expect(user.created_at).to eq(DateTime.parse('2016-08-26 14:37:10 UTC'))
      expect(user.email).to eq('rowan.mosciski@example.com')
      expect(user.id).to eq('user_19')
      expect(user.first_name).to eq('Rowan')
      expect(user.last_name).to eq('Mosciski')
      expect(user.role).to eq('Member')
      expect(user.status).to eq('active')
      expect(user.updated_at).to eq(DateTime.parse('2016-08-26 14:37:10 UTC'))
    end
  end

  it_behaves_like 'a model'
end
