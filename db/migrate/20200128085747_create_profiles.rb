class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :picture
      t.string :myphoto
      t.string :mycomment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
