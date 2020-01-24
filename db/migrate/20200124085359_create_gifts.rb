class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.integer :price
      t.references :hope, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
