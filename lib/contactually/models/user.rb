module Contactually
  module Models
    class User
      include Model

      field :avatar_url, :string
      field :created_at, :datetime
      field :email, :string
      field :id, :string
      field :first_name, :string
      field :last_name, :string
      field :role, :string
      field :status, :string
      field :updated_at, :datetime

      field :extra_data, Hash
    end
  end
end
