class CreateHopes < ActiveRecord::Migration[6.0]
  def change
    create_table :hopes do |t|
      t.string :image,      null: false
      t.string :message,    null: false
      t.timestamps
    end
  end
end
