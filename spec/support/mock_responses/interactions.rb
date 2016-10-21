module MockResponses
  module Interactions
    def self.fetch_response
      <<-JSON
      {
        "data": {
          "id": "interaction_10257",
          "created_at": "2016-09-28 15:17:23 UTC",
          "updated_at": "2016-09-28 15:17:23 UTC",
          "body": null,
          "initiated_by_contact": true,
          "subject": "Fundamental full-range time-frame",
          "timestamp": "2016-09-28 15:17:23 UTC",
          "type": "email",
          "participants": [
            {
              "contact_id": "contact_2313",
              "handle": "cordelia.walsh@example.com",
              "extra_data": {
                "first_name": "Cordelia",
                "last_name": "Walsh",
                "avatar_url": null
              }
            },
            {
              "contact_id": "contact_2314",
              "handle": "phyllis.lockman@example.com",
              "extra_data": {
                "first_name": "Phyllis",
                "last_name": "Lockman",
                "avatar_url": null
              }
            },
            {
              "contact_id": "contact_2315",
              "handle": "tevin.koelpin@example.com",
              "extra_data": {
                "first_name": "Tevin",
                "last_name": "Koelpin",
                "avatar_url": null
              }
            }
          ],
          "extra_data": {
            "editable": true,
            "participant_count": 3,
            "placeholder": false,
            "contact_id": "contact_2313",
            "contact_handle": "cordelia.walsh@example.com",
            "associated_account_id": null,
            "associated_user": {
              "id": "user_77",
              "created_at": "2016-09-28 15:17:21 UTC",
              "updated_at": "2016-09-28 15:17:21 UTC",
              "first_name": "Danielle",
              "last_name": "Block",
              "email": "danielle.block@example.com",
              "avatar_url": null,
              "role": null,
              "status": "active"
            },
            "contact": {
              "id": "contact_2313",
              "created_at": "2016-09-28 15:17:22 UTC",
              "updated_at": "2016-09-28 15:17:22 UTC",
              "first_name": "Cordelia",
              "last_name": "Walsh",
              "company": null,
              "title": "General Department Secretary",
              "avatar_url": null,
              "tags": [],
              "addresses": [
                {
                  "id": "825be081-4fe7-4af3-b6f4-a85ce35df773",
                  "full_address": "West Hallieton",
                  "label": "Mobile",
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
                  "id": "contact_identity_2272",
                  "label": null,
                  "address": "cordelia.walsh@example.com"
                }
              ],
              "social_media_profiles": [
                {
                  "id": "18ef5f8e-aa49-4e63-9ec7-96d1e82992a7",
                  "label": "Twitter",
                  "url": "http://aufderhar.us"
                }
              ],
              "websites": [
                {
                  "id": "eae18e21-f538-4f5c-92a2-c258e2968879",
                  "label": "Social",
                  "address": "http://russel.biz"
                }
              ],
              "phone_numbers": [
                {
                  "id": "003c4b3e-e09c-442d-a689-bb9c3fd34c4e",
                  "label": "Corner Payphone",
                  "number": "(972)111-9216 x6319"
                }
              ],
              "custom_fields": [],
              "extra_data": {
                "last_contacted": null,
                "muted_at": "2016-09-28 15:17:24 UTC",
                "relationship_status": "none",
                "team_last_contacted_at": null,
                "team_last_contacted_by_id": null,
                "buckets": [],
                "followup_source": null
              }
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
