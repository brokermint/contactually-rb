module Contactually
  class Contacts < Base
    implements :create, :list, :fetch, :update, :destroy

    def initialize(url: '/v2/contacts', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      Models::Contact
    end

    def list_in_batches(params)
      collection = Response.new(interface.get(url, params), self).data
      return unless collection.total > 0

      while collection.items.any?
        yield collection

        break unless collection.has_next_page?


        # The problem: Contactually API return 404 status code when we get next batch with `next_page` URL
        #  from the response.
        #
        # HACK: API endpoint `/v2/contacts/search` doesn't work correct.
        url = collection.next_page.gsub('/search', '')
        _old_page = params.delete(:page)

        collection = Response.new(interface.get(url, params), self).data
      end
    end
  end
end
