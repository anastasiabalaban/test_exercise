# frozen_string_literal: true

module ProductArticles
  class Update < ApplicationService
    def initialize(params:)
      @params = params
    end

    def call
      return unless product_article || related_articles.any?

      update_articles
    end

    private

    attr_reader :params

    def update_articles
      related_articles.map do |related_article|
        RelatedArticle.create(
          product_article: product_article, related_article: related_article
        )
      end
    end

    def related_articles
      @related_articles ||= ProductArticle.where(sku: params[:related_sku])
    end

    def product_article
      @product_article ||= ProductArticle.find_by(sku: params[:article_sku])
    end
  end
end
