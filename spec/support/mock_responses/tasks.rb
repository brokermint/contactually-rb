module MockResponses
  module Tasks
    def self.fetch_response
      <<-JSON
      {
        "data": {
          "id": "task_31",
          "created_at": "2016-08-26 14:37:11 UTC",
          "updated_at": "2016-08-26 14:37:11 UTC",
          "assigned_to_id": "user_19",
          "contact_id": "contact_31",
          "due_at": "2016-08-27 14:37:11 UTC",
          "title": "Ut explicabo dolores ea tempora quis aliquid omnis dicta quibusdam praesentium perspiciatis deserunt totam.",
          "extra_data": {
            "assigned_at": null,
            "completed_at": null,
            "contact": {
              "id": "contact_31",
              "created_at": "2016-08-26 14:37:11 UTC",
              "updated_at": "2016-08-26 14:37:11 UTC",
              "first_name": "Wilford",
              "last_name": "Wilderman",
              "company": null,
              "title": "Operations Director",
              "avatar_url": null,
              "tags": [],
              "addresses": [
                {
                  "id": "ab0006d1-89d0-4991-854a-a9cb7957d091",
                  "full_address": "Corrineside",
                  "label": "Office",
                  "street_1": null,
                  "street_2": null,
                  "city": null,
                  "state": null,
                  "zip": null,
                  "country": null
                }
              ],
              "email_addresses": [
                {
                  "id": "contact_identity_19",
                  "label": null,
                  "address": "wilford.wilderman@example.com"
                }
              ],
              "social_media_profiles": [
                {
                  "id": "30435661-5e2f-4886-871a-b2b99d0b3afb",
                  "label": "LinkedIn",
                  "url": "http://frami.com"
                }
              ],
              "websites": [
                {
                  "id": "dc586325-d569-46c5-b19a-e7b7f8cfa80e",
                  "label": "Business",
                  "address": "http://kovacekmuller.co.uk"
                }
              ],
              "phone_numbers": [
                {
                  "id": "92f19ed2-0cde-4b48-ab75-f95ed316d143",
                  "label": "Home",
                  "number": "(692)717-4331"
                }
              ],
              "custom_fields": [],
              "extra_data": {
                "last_contacted": null,
                "muted_at": null,
                "relationship_status": "none",
                "team_last_contacted_at": null,
                "team_last_contacted_by_id": null,
                "followup_source": null,
                "buckets": [
                  {
                    "id": "bucket_38",
                    "name": "User-centric attitude-oriented function"
                  },
                  {
                    "id": "bucket_39",
                    "name": "Horizontal leading edge attitude"
                  }
                ]
              }
            },
            "created_by": null,
            "assigned_by": null,
            "assigned_to": {
              "id": "user_19",
              "created_at": "2016-08-26 14:37:10 UTC",
              "updated_at": "2016-08-26 14:37:10 UTC",
              "first_name": "Rowan",
              "last_name": "Mosciski",
              "email": "rowan.mosciski@example.com",
              "avatar_url": null,
              "role": null,
              "status": "active"
            }
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
