module MockResponses
  module ContactDeals
    def self.list_response
      <<-JSON
      {
        "data": [
          {
            "id": "deal_111271557",
            "created_at": "2018-11-20T01:28:34Z",
            "updated_at": "2018-11-29T11:38:28Z",
            "name": "123 abc street",
            "value": 150000,
            "currency": null,
            "stage_id": "stage_111271526",
            "status": "open"
          }
        ],
        "meta": {
          "total": 1,
          "next_page": null,
          "previous_page": null
        }
      }
      JSON
    end
  end
end
