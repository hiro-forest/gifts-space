class Profile < ApplicationRecord
  has_one :user


  mount_uploader :picture, PictureUploader
  mount_uploader :myphoto, MyphotoUploader
end
