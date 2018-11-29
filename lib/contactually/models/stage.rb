module Contactually
  module Models
    class Stage
      include Model

      field :id, :string
      field :created_at, :datetime
      field :updated_at, :datetime
      field :name, :string
      field :reminder_interval, :integer
    end
  end
end
