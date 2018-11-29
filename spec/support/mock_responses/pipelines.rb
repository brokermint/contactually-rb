module MockResponses
  module Pipelines
    def self.create_response
      self.fetch_response
    end

    def self.list_response
      <<-JSON
        {
          "data": [
            {
              "id": "pipeline_325497",
              "created_at": "2018-11-20T01:27:35Z",
              "updated_at": "2018-11-20T01:27:51Z",
              "name": "Buyers - Real Estate",
              "goal": "Track your clients who are buying a house",
              "stages": [
                {
                  "id": "stage_111271526",
                  "created_at": "2018-11-20T01:27:35Z",
                  "updated_at": "2018-11-20T01:27:35Z",
                  "name": "Actively viewing properties ",
                  "reminder_interval": 2
                },
                {
                  "id": "stage_111271527",
                  "created_at": "2018-11-20T01:27:35Z",
                  "updated_at": "2018-11-20T01:27:35Z",
                  "name": "Offer sent",
                  "reminder_interval": 2
                },
                {
                  "id": "stage_111271528",
                  "created_at": "2018-11-20T01:27:35Z",
                  "updated_at": "2018-11-20T01:27:35Z",
                  "name": "Offer accepted",
                  "reminder_interval": null
                },
                {
                  "id": "stage_111271529",
                  "created_at": "2018-11-20T01:27:35Z",
                  "updated_at": "2018-11-20T01:27:35Z",
                  "name": "Inspection/loan approval ",
                  "reminder_interval": 3
                },
                {
                  "id": "stage_111271530",
                  "created_at": "2018-11-20T01:27:35Z",
                  "updated_at": "2018-11-20T01:27:35Z",
                  "name": "Closing ",
                  "reminder_interval": 2
                },
                {
                  "id": "stage_111825250",
                  "created_at": "2018-11-29T11:39:21Z",
                  "updated_at": "2018-11-29T11:39:21Z",
                  "name": "Decline",
                  "reminder_interval": null
                }
              ],
              "extra_data": {
                "cloned_from_id": 5
              }
            },
            {
              "id": "pipeline_322870",
              "created_at": "2018-11-07T18:20:24Z",
              "updated_at": "2018-11-07T18:20:24Z",
              "name": "Sales",
              "goal": "Qualify leads and close the deal.",
              "stages": [
                {
                  "id": "stage_110432298",
                  "created_at": "2018-11-07T18:20:24Z",
                  "updated_at": "2018-11-07T18:20:24Z",
                  "name": "Prospecting",
                  "reminder_interval": null
                },
                {
                  "id": "stage_110432299",
                  "created_at": "2018-11-07T18:20:24Z",
                  "updated_at": "2018-11-07T18:20:24Z",
                  "name": "Qualifying conversation",
                  "reminder_interval": 7
                },
                {
                  "id": "stage_110432300",
                  "created_at": "2018-11-07T18:20:24Z",
                  "updated_at": "2018-11-07T18:20:24Z",
                  "name": "Meeting scheduled",
                  "reminder_interval": 7
                },
                {
                  "id": "stage_110432301",
                  "created_at": "2018-11-07T18:20:24Z",
                  "updated_at": "2018-11-07T18:20:24Z",
                  "name": "Meeting follow up",
                  "reminder_interval": 2
                },
                {
                  "id": "stage_110432302",
                  "created_at": "2018-11-07T18:20:24Z",
                  "updated_at": "2018-11-07T18:20:24Z",
                  "name": "Proposal sent",
                  "reminder_interval": 3
                },
                {
                  "id": "stage_110432303",
                  "created_at": "2018-11-07T18:20:24Z",
                  "updated_at": "2018-11-07T18:20:24Z",
                  "name": "Negotiating",
                  "reminder_interval": 2
                },
                {
                  "id": "stage_110432304",
                  "created_at": "2018-11-07T18:20:24Z",
                  "updated_at": "2018-11-07T18:20:24Z",
                  "name": "Completed",
                  "reminder_interval": null
                }
              ],
              "extra_data": {
                "cloned_from_id": 2
              }
            }
          ],
          "meta": {
            "total": 2,
            "next_page": null,
            "previous_page": null
          }
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
          "id": "pipeline_325497",
          "created_at": "2018-11-20T01:27:35Z",
          "updated_at": "2018-11-20T01:27:51Z",
          "name": "Buyers - Real Estate",
          "goal": "Track your clients who are buying a house",
          "stages": [
            {
              "id": "stage_111271526",
              "created_at": "2018-11-20T01:27:35Z",
              "updated_at": "2018-11-20T01:27:35Z",
              "name": "Actively viewing properties ",
              "reminder_interval": 2
            },
            {
              "id": "stage_111271527",
              "created_at": "2018-11-20T01:27:35Z",
              "updated_at": "2018-11-20T01:27:35Z",
              "name": "Offer sent",
              "reminder_interval": 2
            },
            {
              "id": "stage_111271528",
              "created_at": "2018-11-20T01:27:35Z",
              "updated_at": "2018-11-20T01:27:35Z",
              "name": "Offer accepted",
              "reminder_interval": null
            },
            {
              "id": "stage_111271529",
              "created_at": "2018-11-20T01:27:35Z",
              "updated_at": "2018-11-20T01:27:35Z",
              "name": "Inspection/loan approval ",
              "reminder_interval": 3
            },
            {
              "id": "stage_111271530",
              "created_at": "2018-11-20T01:27:35Z",
              "updated_at": "2018-11-20T01:27:35Z",
              "name": "Closing ",
              "reminder_interval": 2
            },
            {
              "id": "stage_111825250",
              "created_at": "2018-11-29T11:39:21Z",
              "updated_at": "2018-11-29T11:39:21Z",
              "name": "Decline",
              "reminder_interval": null
            }
          ],
          "extra_data": {
            "cloned_from_id": 5
          }
        },
        "meta": {
          "empty": true
        }
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
