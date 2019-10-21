# frozen_string_literal: true

class ProductPhoto < ApplicationRecord
  belongs_to :product_article
end
