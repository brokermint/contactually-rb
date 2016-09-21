require 'spec_helper'

describe Contactually do
  describe '#configure' do
    it 'can set the adapter' do
      adapter = double('fake adapter')

      Contactually.configure do |config|
        config.adapter = adapter
      end

      expect(Contactually.configuration.adapter).to eq(adapter)
    end
  end
end
