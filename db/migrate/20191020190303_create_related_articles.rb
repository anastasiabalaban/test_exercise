class CreateRelatedArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :related_articles do |t|
      t.references :product_article
      t.references :related_article
    end
  end
end
