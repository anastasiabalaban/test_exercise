# frozen_string_literal: true

class RelatedArticle < ApplicationRecord
  belongs_to :product_article
  belongs_to :related_article, class_name: ProductArticle.name
end
