require 'spec_helper'

describe Contactually::Tasks do
  describe '#model' do
    it 'returns the Task class' do
      expect(described_class.new.model).to eq(Contactually::Models::Task)
    end
  end

  describe '.implements' do
    it 'implements create endpoint functionality' do
      client = build_client
      stub_request(:post, 'https://api.contactually.com/v2/tasks').
        to_return(body: MockResponses::Tasks.create_response, headers: {'Content-Type' => 'application/json'})

      task = client.tasks.create({data: {title: 'test'}}.to_json)

      expect(client.tasks.response.body).to eq(JSON.parse(MockResponses::Tasks.create_response))
      expect(task).to be_a(Contactually::Models::Task)
    end

    it 'implements fetch endpoint functionality' do
      client = build_client
      stub_request(:get, 'https://api.contactually.com/v2/tasks/task_31').
        to_return(body: MockResponses::Tasks.fetch_response, headers: {'Content-Type' => 'application/json'})

      task = client.tasks.fetch('task_31')

      expect(client.tasks.response.body).to eq(JSON.parse(MockResponses::Tasks.fetch_response))
      expect(task).to be_a(Contactually::Models::Task)
    end

    it 'implements update endpoint functionality' do
      client = build_client
      stub_request(:patch, 'https://api.contactually.com/v2/tasks/task_31').
        to_return(body: MockResponses::Tasks.update_response, headers: {'Content-Type' => 'application/json'})

      task = client.tasks.update('task_31', {data: {title: 'test'}}.to_json)

      expect(client.tasks.response.body).to eq(JSON.parse(MockResponses::Tasks.update_response))
      expect(task).to be_a(Contactually::Models::Task)
    end

    it 'implements delete endpoint functionality' do
      client = build_client
      stub_request(:delete, 'https://api.contactually.com/v2/tasks/task_31').
        to_return(body: MockResponses::Tasks.fetch_response, headers: {'Content-Type' => 'application/json'})

      client.tasks.destroy('task_31')

      expect(client.tasks.response.status).to eq(200)
    end
  end
end
