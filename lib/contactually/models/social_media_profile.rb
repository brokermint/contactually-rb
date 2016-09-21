module Contactually
  module Models
    class SocialMediaProfile
      include Model

      field :id, :string
      field :label, :string
      field :url, :string
    end
  end
end
