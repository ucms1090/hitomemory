class Memory < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :thumbnail
  has_one_attached :memory_image

  devise :database_authenticatable, authentication_keys: [:memory_name]

  has_many :users, through: :memory_users
  has_many :memory_users


end
