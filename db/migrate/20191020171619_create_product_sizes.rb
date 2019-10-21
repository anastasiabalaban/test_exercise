class CreateProductSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_sizes do |t|
      t.string  :sku
      t.boolean :available

      t.belongs_to :product_article
      t.belongs_to :size

      t.timestamps
    end
  end
end
