class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.bigint :user_id,         foreign_key: true
      t.integer :number,         null: false
      t.date :expiration,        null: false
      t.integer :security_code,  null: false
      t.timestamps
    end
  end
end
