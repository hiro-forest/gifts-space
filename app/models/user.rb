class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :hopes, dependent: :destroy
  has_one :profile, dependent: :destroy



  validates :nickname,        presence: true, uniqueness: true
  validates :email,           presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password,        presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,40}+\z/i }
end
