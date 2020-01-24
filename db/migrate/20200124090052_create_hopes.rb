class CreateHopes < ActiveRecord::Migration[6.0]
  def change
    create_table :hopes do |t|
      t.string :image
      t.string :message
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
