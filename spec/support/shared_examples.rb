shared_examples 'a model' do
  it 'allows for extra data not defined' do
    model = described_class.new({'nonexistent_key' => 'still store it'})

    expect(model.nonexistent_key).to eq('still store it')
  end

  describe '#inspect' do
    class FakeModel
      include Contactually::Models::Model

      field :foo_str, :string
      field :foo_int, :integer
    end

    it 'outputs model instances in a friendly format' do
      expected_string = '#<FakeModel foo_str: nil, foo_int: nil>'
      model = FakeModel.new

      expect(model.inspect).to eq(expected_string)
    end
  end
end
