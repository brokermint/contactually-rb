module Contactually
  class Collection
    extend Forwardable
    include Enumerable

    attr_reader :items, :next_page, :previous_page, :total

    def initialize(items, meta: {})
      @items = items

      @next_page = meta['next_page']
      @previous_page = meta['previous_page']
      @total = meta['total']
    end

    def each(&block)
      items.each do |item|
        block.call(item)
      end
    end

    def has_next_page?
      !next_page.nil?
    end

    def has_previous_page?
      !previous_page.nil?
    end

    def_delegator :items, :last
    def_delegator :items, :size
  end
end
