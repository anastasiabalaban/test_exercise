# frozen_string_literal: true

class ProductArticle < ApplicationRecord
  belongs_to :product
  has_many :product_sizes
  has_many :product_photos
  has_many :related_articles, foreign_key: :product_article_id

  validates :name, presence: true
  validates :url,  presence: true
  validates :sku,  presence: true

  accepts_nested_attributes_for :product_sizes, :product_photos
end
