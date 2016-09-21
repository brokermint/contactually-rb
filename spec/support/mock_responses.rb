module MockResponses
  def self.parsed_data(json)
    JSON.parse(json)['data']
  end
end
