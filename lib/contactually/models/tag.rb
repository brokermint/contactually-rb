module Contactually
  module Models
    class Tag
      include Model

      field :contact_count, :integer
      field :created_at, :datetime
      field :id, :string
      field :name, :string
      field :updated_at, :datetime
    end
  end
end
