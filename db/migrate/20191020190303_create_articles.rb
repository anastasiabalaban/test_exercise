class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :product_article
      t.references :related_article
    end
  end
end
