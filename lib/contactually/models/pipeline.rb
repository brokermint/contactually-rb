module Contactually
  module Models
    class Pipeline
      include Model

      field :id, :string
      field :created_at, :datetime
      field :updated_at, :datetime
      field :name, :string
      field :goal, :string

      field :stages, [Stage]
    end
  end
end
