class ChangeColumnToCard < ActiveRecord::Migration[5.2]
  def up
    change_column :cards, :expiration, :string, null: false
  end

  def down
    change_column :cards, :expiration, :date, null: false
  end
end
