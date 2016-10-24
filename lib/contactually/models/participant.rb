module Contactually
  module Models
    class Participant
      include Model

      field :contact_id, :string
      field :handle, :string
    end
  end
end
