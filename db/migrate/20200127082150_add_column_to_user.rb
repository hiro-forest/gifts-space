class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :myimage, :string
    add_column :users, :photo, :string
    add_column :users, :comment, :string
  end
end
