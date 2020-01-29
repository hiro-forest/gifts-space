class AddUserRefToHopes < ActiveRecord::Migration[6.0]
  def change
    add_reference :hopes, :user, null: false, foreign_key: true
  end
end
