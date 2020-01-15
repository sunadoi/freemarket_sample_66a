class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.bigint :user_id, foreign_key: true
      t.bigint :product_id, foreign_key: true
      t.integer :evaluate
      t.text :comment
      t.timestamps
    end
  end
end
