module MockResponses
  module Tags
    def self.list_response
      <<-JSON
      {
          "meta": {
              "total": 3,
              "next_page": null,
              "previous_page": null
          },
          "data": [
              {
                  "id": "tag_40",
                  "created_at": "2016-08-26 14:37:12 UTC",
                  "updated_at": "2016-08-26 14:37:12 UTC",
                  "name": "Multi-lateral grid-enabled benchmark",
                  "contact_count": 0
              },
              {
                  "id": "tag_41",
                  "created_at": "2016-08-26 14:37:12 UTC",
                  "updated_at": "2016-08-26 14:37:12 UTC",
                  "name": "Devolved tangible complexity",
                  "contact_count": 0
              },
              {
                  "id": "tag_42",
                  "created_at": "2016-08-26 14:37:12 UTC",
                  "updated_at": "2016-08-26 14:37:12 UTC",
                  "name": "Balanced discrete attitude",
                  "contact_count": 0
              }
          ]
      }
      JSON
    end

    def self.list_data
      MockResponses.parsed_data(list_response)
    end
  end
end