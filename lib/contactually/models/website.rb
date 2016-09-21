module Contactually
  module Models
    class Website
      include Model

      field :id, :string
      field :label, :string
      field :address, :string
    end
  end
end
