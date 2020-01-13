class ChangeColumnToAddress < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :building, :string, null: true
  end

  def down
    change_column :addresses, :building, :string, null: false
  end
end
