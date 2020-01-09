class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.bigint :product_id,   foreign_key: true
      t.text :image,          null: false
      t.timestamps
    end
  end
end
