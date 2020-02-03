class AddColumnToHope < ActiveRecord::Migration[6.0]
  def change
    add_column :hopes, :desired_price, :integer, null: false
  end
end
