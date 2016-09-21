require 'spec_helper'

describe Contactually::Models::Bucket do
  describe 'schema' do
    it 'instantiates a bucket from a response hash' do
      bucket = described_class.new(MockResponses::Buckets.fetch_data)

      expect(bucket.created_at).to eq(DateTime.parse('2016-08-26 14:37:11 UTC'))
      expect(bucket.goal).to eq('Real life goal')
      expect(bucket.id).to eq('bucket_37')
      expect(bucket.name).to eq('Multi-channelled asynchronous implementation')
      expect(bucket.reminder_interval).to eq(30)
      expect(bucket.updated_at).to eq(DateTime.parse('2016-08-26 14:37:11 UTC'))
      expect(bucket.extra_data).to eq({
        'relationship_status' => {
          'none' => 0,
          'strong' => 0,
          'fading' => 0,
          'weak' => 0,
          'rpa' => 0,
          'grade' => 'C-',
          'total' => 0
        },
        'contact_count' => 3
      })
    end
  end

  it_behaves_like 'a model'
end
