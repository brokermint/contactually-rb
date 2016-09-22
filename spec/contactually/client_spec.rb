require 'spec_helper'

describe Contactually::Client do
  describe '#initialize' do
    it 'sets the interface' do
      client = build_client

      expect(client.interface).to be_a(Contactually::Interface)
    end
  end

  describe '#buckets' do
    it 'returns a buckets instance' do
      client = build_client

      buckets = client.buckets

      expect(buckets).to be_a(Contactually::Buckets)
    end

    it 'memoizes the returned instance' do
      client = build_client

      buckets = client.buckets
      second_buckets = client.buckets

      expect(buckets).to eq(second_buckets)
    end
  end

  describe '#contacts' do
    it 'returns a buckets instance' do
      client = build_client

      contacts = client.contacts

      expect(contacts).to be_a(Contactually::Contacts)
    end

    it 'memoizes the returned instance' do
      client = build_client

      contacts = client.contacts
      second_contacts = client.contacts

      expect(contacts).to eq(second_contacts)
    end
  end

  describe '#tags' do
    it 'returns a tag instance' do
      client = build_client

      tags = client.tags

      expect(tags).to be_a(Contactually::Tags)
    end

    it 'memoizes the returned instance' do
      client = build_client

      tags = client.tags
      second_tags = client.tags

      expect(tags).to eq(second_tags)
    end
  end

  describe '#tasks' do
    it 'returns a task instance' do
      client = build_client

      tasks = client.tasks

      expect(tasks).to be_a(Contactually::Tasks)
    end

    it 'memoizes the returned instance' do
      client = build_client

      tasks = client.tasks
      second_tasks = client.tasks

      expect(tasks).to eq(second_tasks)
    end
  end

  describe '#me' do
    it 'returns a user instance' do
      client = build_client

      tasks = client.me

      expect(tasks).to be_a(Contactually::Me)
    end

    it 'memoizes the returned instance' do
      client = build_client

      user = client.me
      second_user = client.me

      expect(user).to eq(second_user)
    end
  end
end
