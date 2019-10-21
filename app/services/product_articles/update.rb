# frozen_string_literal: true

module ProductArticles
  class Update < ApplicationService
    def initialize(params:)
      @params = params
    end

    def call
      return unless product_article || related_articles.any?

      related_articles.map(&method(:create_related_article))
    end

    private

    attr_reader :params

    def create_related_article(related_article)
      Article.create(product_article: product_article, related_article: related_article)
    end

    def related_articles
      @related_articles ||= ProductArticle.where(sku: params[:related_sku])
    end

    def product_article
      @product_article ||= ProductArticle.find_by(sku: params[:article_sku])
    end
  end
end
