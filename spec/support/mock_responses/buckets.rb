module MockResponses
  module Buckets
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
            "id": "bucket_37",
            "created_at": "2016-08-26 14:37:11 UTC",
            "updated_at": "2016-08-26 14:37:11 UTC",
            "name": "Multi-channelled asynchronous implementation",
            "goal": null,
            "reminder_interval": null,
            "extra_data": {
              "relationship_status": {
                "none": 0,
                "strong": 0,
                "fading": 0,
                "weak": 0,
                "rpa": 0,
                "grade": "C-",
                "total": 0
              },
              "contact_count": 3
            }
          },
          {
            "id": "bucket_38",
            "created_at": "2016-08-26 14:37:11 UTC",
            "updated_at": "2016-08-26 14:37:11 UTC",
            "name": "User-centric attitude-oriented function",
            "goal": null,
            "reminder_interval": null,
            "extra_data": {
              "relationship_status": {
                "none": 0,
                "strong": 0,
                "fading": 0,
                "weak": 0,
                "rpa": 0,
                "grade": "C-",
                "total": 0
              },
              "contact_count": 1
            }
          },
          {
            "id": "bucket_39",
            "created_at": "2016-08-26 14:37:11 UTC",
            "updated_at": "2016-08-26 14:37:11 UTC",
            "name": "Horizontal leading edge attitude",
            "goal": null,
            "reminder_interval": null,
            "extra_data": {
              "relationship_status": {
                "none": 0,
                "strong": 0,
                "fading": 0,
                "weak": 0,
                "rpa": 0,
                "grade": "C-",
                "total": 0
              },
              "contact_count": 1
            }
          }
        ]
      }
      JSON
    end

    def self.list_data
      MockResponses.parsed_data(list_response)
    end

    def self.fetch_response
      <<-JSON
      {
        "data": {
          "id": "bucket_37",
          "created_at": "2016-08-26 14:37:11 UTC",
          "updated_at": "2016-08-26 14:37:11 UTC",
          "name": "Multi-channelled asynchronous implementation",
          "goal": "Real life goal",
          "reminder_interval": 30,
          "extra_data": {
            "relationship_status": {
              "none": 0,
              "strong": 0,
              "fading": 0,
              "weak": 0,
              "rpa": 0,
              "grade": "C-",
              "total": 0
            },
            "contact_count": 3
          }
        },
        "meta": {}
      }
      JSON
    end

    def self.fetch_data
      MockResponses.parsed_data(fetch_response)
    end

    def self.update_response
      self.fetch_response
    end
  end
end
