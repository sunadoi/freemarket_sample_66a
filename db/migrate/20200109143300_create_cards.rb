class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.bigint :user_id,         foreign_key: true
      t.string :customer_id,     null: false
      t.string :card_id,         null: false
      t.timestamps
    end
  end
end
