module MockResponses
  module Users
    def self.fetch_response
      <<-JSON
      {
        "data": {
          "id": "user_19",
          "created_at": "2016-08-26 14:37:10 UTC",
          "updated_at": "2016-08-26 14:37:10 UTC",
          "first_name": "Rowan",
          "last_name": "Mosciski",
          "email": "rowan.mosciski@example.com",
          "avatar_url": "http://placekitten.com.s3.amazonaws.com/homepage-samples/408/287.jpg",
          "role": "Member",
          "status": "active"
        },
        "meta": {}
      }
      JSON
    end

    def self.update_response
      self.fetch_response
    end

    def self.fetch_data
      MockResponses.parsed_data(fetch_response)
    end
  end
end
