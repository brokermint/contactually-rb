module Contactually
  module Models
    class PhoneNumber
      include Model

      field :id, :string
      field :label, :string
      field :number, :string
    end
  end
end
