class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.bigint :user_id,               foreign_key: true
      t.bigint :category_id,           foreign_key: true
      t.bigint :brand_id,              foreign_key: true
      t.integer :size
      t.integer :condition
      t.string :name,                  null: false
      t.text :description,             null: false
      t.integer :shipping_charge,      null: false
      t.integer :shipping_method,      null: false
      t.integer :shipping_prefecture,  null: false
      t.integer :shipping_days,        null: false
      t.integer :price,                null: false
      t.integer :progress,             null: false
      t.timestamps
    end
  end
end
