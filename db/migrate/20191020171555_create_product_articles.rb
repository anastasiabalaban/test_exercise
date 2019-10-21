class CreateProductArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :product_articles do |t|
      t.string  :name
      t.string  :url
      t.string  :sku
      t.decimal :price

      t.belongs_to :product

      t.timestamps
    end
  end
end
