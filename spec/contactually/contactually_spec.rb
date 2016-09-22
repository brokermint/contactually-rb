require 'spec_helper'

describe Contactually do
  describe '#configure' do
    it 'can set the adapter' do
      adapter = double('fake adapter')
      original_adapter = Contactually.configuration.adapter

      Contactually.configuration.adapter = adapter

      expect(Contactually.configuration.adapter).to eq(adapter)

      Contactually.configuration.adapter = original_adapter
    end
  end
end
