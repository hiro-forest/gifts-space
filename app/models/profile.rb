class Profile < ApplicationRecord
  has_one :user

  validates :picture,          presence: true

  mount_uploader :picture, PictureUploader
  mount_uploader :myphoto, MyphotoUploader
end
