class CreateProductPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :product_photos do |t|
      t.string :url
      t.belongs_to :product_article

      t.timestamps
    end
  end
end
