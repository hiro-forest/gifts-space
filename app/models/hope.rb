class Hope < ApplicationRecord
  has_many :gifts
  belongs_to :user

  mount_uploader :image, ImageUploader
end
