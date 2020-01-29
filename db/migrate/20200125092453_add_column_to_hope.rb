class AddColumnToHope < ActiveRecord::Migration[6.0]
  def change
    add_column :hopes, null: false, :desired_price, :integer
  end
end
