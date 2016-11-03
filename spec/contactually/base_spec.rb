require 'spec_helper'

describe Contactually::Base do
  class FakeProxy < Contactually::Base
    implements :list

    def initialize(url: '/v2/fake', interface: nil)
      @url = url
      @interface = interface
    end

    def model
      OpenStruct
    end
  end

  describe '#list_each' do
    it 'yields each object to a block and goes to next page when there is one' do
      interface = double('interface')
      proxy = FakeProxy.new(interface: interface)
      first_page = OpenStruct.new(body: JSON.parse(fetch_mock_pagination_response))
      second_page = OpenStruct.new(body: JSON.parse(fetch_last_page_mock_pagination_response))
      allow(interface).to receive(:get).and_return(first_page, second_page)

      collection = proxy.list_each.inject([]) { |acc, obj| acc << obj }

      expect(collection.size).to eq(3)
      expect(collection.map(&:name)).to eq(%w(foo bar lorem))
    end

    it 'returns an enum if no block is given' do
      interface = double('interface')
      proxy = FakeProxy.new(interface: interface)

      expect(proxy.list_each).to be_a(Enumerable)
    end
  end

  def fetch_mock_pagination_response
    <<-JSON
    {
      "meta": {
          "total": 51,
          "next_page": "http://fake/page2",
          "previous_page": null
      },
      "data": [
        {
          "name": "foo"
        },
        {
          "name": "bar"
        }
      ]
    }
    JSON
  end

  def fetch_last_page_mock_pagination_response
    <<-JSON
    {
      "meta": {
          "total": 51,
          "next_page": null,
          "previous_page": null
      },
      "data": [
        {
          "name": "lorem"
        }
      ]
    }
    JSON
  end
end