module Contactually
  module Models
    class Deal
      include Model

      field :id, :string
      field :created_at, :datetime
      field :updated_at, :datetime
      field :name, :string
      field :value, :float
      field :currency, :string
      field :stage_id, :string
      field :status, :string
    end
  end
end
