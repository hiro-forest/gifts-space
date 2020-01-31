class Hope < ApplicationRecord
  has_many :gifts
  belongs_to :user

  validates :image,          presence: true
  validates :message,        presence: true
  validates :desired_price,  presence: true

  mount_uploader :image, ImageUploader
end
