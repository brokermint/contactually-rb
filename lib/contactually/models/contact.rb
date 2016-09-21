module Contactually
  module Models
    class Contact
      include Model

      field :addresses, [Address]
      field :avatar_url, :string
      field :company, :string
      field :created_at, :datetime
      field :email_addresses, [EmailAddress]
      field :first_name, :string
      field :id, :string
      field :last_name, :string
      field :phone_numbers, [PhoneNumber]
      field :social_media_profiles, [SocialMediaProfile]
      field :tags, [String]
      field :title, :string
      field :websites, [Website]
      field :updated_at, :datetime

      # field :custom_fields, [String] TODO: should be it's own model type
      field :extra_data, Hash

      def first_email_address
        if email_addresses
          email_addresses.first
        else
          EmailAddress.new({})
        end
      end
    end
  end
end
