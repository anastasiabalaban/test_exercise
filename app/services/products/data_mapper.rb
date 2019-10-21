# frozen_string_literal: true

module Products
  class DataMapper < ApplicationService
    def initialize(params:)
      @params = params
    end

    def call
      product_attributes
    end

    private

    attr_reader :params

    def product_attributes
      {
        sku:                        params[:product_sku],
        name:                       params[:product_name],
        product_article_attributes: product_article_attributes
      }
    end

    def product_article_attributes
      product_article_params.merge(
        product_photos_attributes: photos_attributes,
        product_sizes_attributes:  product_sizes_attributes
      )
    end

    def product_article_params
      {
        name:  params[:article_name],
        url:   params[:url],
        sku:   params[:article_sku],
        price: params[:price]&.delete('$')
      }
    end

    def product_sizes_attributes
      params[:sizes].map do |size|
        size_params(size).merge(additional_size_params(size[:name]))
      end
    end

    def size_params(size)
      {
        sku:       size[:size_sku],
        available: size[:available]
      }
    end

    def additional_size_params(name)
      size(name) ? { size: size(name) } : { size_attributes: { name: name } }
    end

    def size(name)
      @size ||= Size.find_by(name: name)
    end

    def photos_attributes
      params[:photos]
    end
  end
end
