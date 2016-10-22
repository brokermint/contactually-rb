require 'spec_helper'

describe Contactually::Models::Model do
  describe '#type_cast' do
    it 'throws an error when it cannot coerce the value correctly' do
      class TestClass
        include Contactually::Models::Model

        field :boolean_field, :boolean
      end
      
      expect{TestClass.new({boolean_field: 'Not a boolean value'})}.to raise_error(Contactually::TypeMismatchError)
    end
  end
end

