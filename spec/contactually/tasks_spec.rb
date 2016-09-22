require 'spec_helper'

describe Contactually::Tasks do
  describe '#model' do
    it 'returns the Task class' do
      expect(described_class.new.model).to eq(Contactually::Models::Task)
    end
  end

  describe '.implements' do
    it 'implements fetch endpoint functionality' do
      client = build_client
      stub_request(:get, 'https://api.contactually.com/v2/tasks/task_31').
        to_return(body: MockResponses::Tasks.fetch_response, headers: {'Content-Type' => 'application/json'})

      response = client.tasks.fetch('task_31')

      expect(response.raw_response.body).to eq(JSON.parse(MockResponses::Tasks.fetch_response))
      expect(response.data).to be_a(Contactually::Models::Task)
    end
  end
end
