module Contactually
  module Models
    class Interaction
      include Model

      field :created_at, :datetime
      field :body, :string
      field :id, :string
      field :initiated_by_contact, :boolean
      field :participants, [Participant]
      field :subject, :string
      field :type, :string

      # field :custom_fields, [String] TODO: should be it's own model type
      field :extra_data, Hash

    end
  end
end
