module MockResponses
  module Contacts
    def self.create_response
      self.fetch_response
    end

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
          {
            "id": "contact_32",
            "created_at": "2016-08-26 14:37:11 UTC",
            "updated_at": "2016-08-26 14:37:11 UTC",
            "first_name": "Beatrice",
            "last_name": "Macejkovic",
            "company": null,
            "title": "Associate Sales Secretary",
            "avatar_url": null,
            "tags": [],
            "addresses": [
              {
                "id": "92139e32-44f8-4f71-95e3-a215d61877b0",
                "full_address": "Lake Nicola",
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
                "id": "contact_identity_20",
                "label": null,
                "address": "beatrice.macejkovic@example.com"
              }
            ],
            "social_media_profiles": [
              {
                "id": "cfa5a4e7-0115-4179-8eb9-92a0e2beecdd",
                "label": "LinkedIn",
                "url": "http://cummingscorwin.info"
              }
            ],
            "websites": [
              {
                "id": "20e2c655-8c59-4297-851a-c94609ad3cc4",
                "label": "Business",
                "address": "http://moen.ca"
              }
            ],
            "phone_numbers": [
              {
                "id": "7b3d1c69-c792-4391-b4ab-bca607930049",
                "label": "Home",
                "number": "(830)285-9851 x5271"
              }
            ],
            "custom_fields": [],
            "extra_data": {
              "last_contacted": null,
              "muted_at": "2016-08-26 14:37:12 UTC",
              "relationship_status": "none",
              "team_last_contacted_at": null,
              "team_last_contacted_by_id": null,
              "followup_source": null,
              "buckets": []
            }
          },
          {
            "id": "contact_33",
            "created_at": "2016-08-26 14:37:11 UTC",
            "updated_at": "2016-08-26 14:37:11 UTC",
            "first_name": "Kennedi",
            "last_name": "Rau",
            "company": null,
            "title": "Marketing Secretary",
            "avatar_url": null,
            "tags": [],
            "addresses": [
              {
                "id": "af8c0622-8dc5-41d2-af0e-054aa209391e",
                "full_address": "Gleasonbury",
                "label": "Home",
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
                "id": "contact_identity_21",
                "label": null,
                "address": "kennedi.rau@example.com"
              }
            ],
            "social_media_profiles": [
              {
                "id": "1a2d7f4d-f3e0-4278-a595-ddb6e555f4ad",
                "label": "Facebook",
                "url": "http://kuhic.co.uk"
              }
            ],
            "websites": [
              {
                "id": "1dd50eb2-c2c8-48a3-830e-bfe7471e0b2d",
                "label": "Personal",
                "address": "http://armstrong.ca"
              }
            ],
            "phone_numbers": [
              {
                "id": "2b32921f-2a68-4d0d-a125-946ce1dda2f7",
                "label": "Home",
                "number": "261.705.1269 x11178"
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
              "buckets": []
            }
          }
        ]
      }
      JSON
    end

    def self.list_data
      MockResponses.parsed_data(fetch_response)
    end

    def self.fetch_response
      <<-JSON
      {
        "data": {
          "id": "contact_31",
          "created_at": "2016-08-26 14:37:11 UTC",
          "updated_at": "2016-08-26 14:37:11 UTC",
          "first_name": "Wilford",
          "last_name": "Wilderman",
          "company": "Awesome Inc.",
          "title": "Operations Director",
          "avatar_url": "http://placekitten.com/200/300",
          "tags": ["tag 1", "tag 2"],
          "addresses": [
            {
              "id": "ab0006d1-89d0-4991-854a-a9cb7957d091",
              "full_address": "480 Ellis St",
              "label": "Office",
              "street_1": "street 1",
              "street_2": "street 2",
              "city": "Sunnyvale",
              "state": "CA",
              "zip": "94086",
              "country": "USA"
            }
          ],
          "email_addresses": [
            {
              "id": "contact_identity_19",
              "label": "Primary Email",
              "address": "wilford.wilderman@example.com"
            }
          ],
          "social_media_profiles": [
            {
              "id": "30435661-5e2f-4886-871a-b2b99d0b3afb",
              "label": "LinkedIn",
              "url": "http://google.com"
            }
          ],
          "websites": [
            {
              "id": "dc586325-d569-46c5-b19a-e7b7f8cfa80e",
              "label": "Business",
              "address": "http://google.co.uk"
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
