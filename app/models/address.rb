class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :todouhuken

  belongs_to :user
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/}
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :street, presence: true
end
