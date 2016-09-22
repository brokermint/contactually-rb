require 'spec_helper'

describe Contactually::Models::Task do
  describe 'schema' do
    it 'instantiates a task from a response hash' do
      task = described_class.new(MockResponses::Tasks.fetch_data)

      expect(task.assigned_to_id).to eq('user_19')
      expect(task.contact_id).to eq('contact_31')
      expect(task.created_at).to eq(DateTime.parse('2016-08-26 14:37:11 UTC'))
      expect(task.due_at).to eq(DateTime.parse('2016-08-27 14:37:11 UTC'))
      expect(task.id).to eq('task_31')
      expect(task.title).to eq('Ut explicabo dolores ea tempora quis aliquid omnis dicta quibusdam praesentium perspiciatis deserunt totam.')
      expect(task.updated_at).to eq(DateTime.parse('2016-08-26 14:37:11 UTC'))
    end
  end

  describe '#contact' do
    it 'returns a contact from extra data field' do
      task = described_class.new(MockResponses::Tasks.fetch_data)

      expect(task.contact).to be_a(Contactually::Models::Contact)
      expect(task.contact.id).to eq(task.contact_id)
    end
  end

  it_behaves_like 'a model'
end
