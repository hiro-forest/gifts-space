class AddHopeRefToGifts < ActiveRecord::Migration[6.0]
  def change
    add_reference :gifts, :hope, null: false, foreign_key: true
  end
end
