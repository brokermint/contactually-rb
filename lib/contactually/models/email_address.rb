module Contactually
  module Models
    class EmailAddress
      include Model

      field :id, :string
      field :label, :string
      field :address, :string
    end
  end
end
