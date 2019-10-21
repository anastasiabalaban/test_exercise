# frozen_string_literal: true

class Product < ApplicationRecord
  has_one :product_article, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :product_article
end
