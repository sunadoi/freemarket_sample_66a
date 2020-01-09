class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.bigint :user,            foreign_key: true
      t.integer :postal_code,    null: false
      t.integer :prefecture,     null: false
      t.string :city,            null: false
      t.string :street,          null: false
      t.string :building,        null: false
      t.timestamps
    end
  end
end
