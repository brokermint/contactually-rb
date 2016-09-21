shared_examples 'a model' do
  it 'allows for extra data not defined' do
    model = described_class.new({'nonexistent_key' => 'still store it'})

    expect(model.nonexistent_key).to eq('still store it')
  end
end
