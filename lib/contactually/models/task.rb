module Contactually
  module Models
    class Task
      include Model

      field :assigned_to_id, :string
      field :contact_id, :string
      field :created_at, :datetime
      field :due_at, :datetime
      field :id, :string
      field :title, :string
      field :updated_at, :datetime

      field :extra_data, Hash

      def contact
        @contact ||= begin
          if contact_included?
            Contact.new(extra_data[CONTACT_KEY])
          end
        end
      end

      private

      CONTACT_KEY = 'contact'.freeze

      def contact_included?
        extra_data.has_key? CONTACT_KEY
      end
    end
  end
end
