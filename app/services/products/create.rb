# frozen_string_literal: true

module Products
  class Create < ApplicationService
    def initialize(params:)
      @params = params
    end

    def call
      Product.create(normalized_params)
    end

    private

    attr_reader :params

    def normalized_params
      ::Products::DataMapper.call(params: params)
    end
  end
end
