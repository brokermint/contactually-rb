module Contactually
  module Models
    class Address
      include Model

      field :city, :string
      field :country, :string
      field :id, :string
      field :full_address, :string
      field :label, :string
      field :state, :string
      field :street_1, :string
      field :street_2, :string
      field :zip, :string
    end
  end
end
