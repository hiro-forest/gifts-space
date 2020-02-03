class Gift < ApplicationRecord
  belongs_to :hope
  belongs_to :user

  # SELECT SUM(price) FROM gifts WHERE hope_id = '26';
  # Gift.all.sum(:price)
  # @gift = Gift.where(hope_id: params[:id]).first
  # @gift.total.sum(:price)
end
