# frozen_string_literal: true

module TestTasks
  class SortSizes < ApplicationService
    SIZE_ORDER_1 = %w[XXS XS S M L XL XXL XS/P S/P M/P L/P XL/P].freeze
    SIZE_ORDER_2 = %w[000 00 0 2 4 6 8 10 12 14].freeze

    def initialize(size_set:)
      @size_set = size_set
    end

    def call
      size_set.sort_by { |item| select_order.index(item) }
    end

    private

    attr_reader :size_set

    def select_order
      (size_set & SIZE_ORDER_1).any? ? SIZE_ORDER_1 : SIZE_ORDER_2
    end
  end
end
