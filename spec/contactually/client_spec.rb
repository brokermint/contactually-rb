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
    it 'returns a buckets instance' do
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
end
