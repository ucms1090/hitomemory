class Memory < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :thumbnail

  devise :database_authenticatable, authentication_keys: [:memory_name]

  has_many :users, through: :memory_users
  has_many :memory_users, dependent: :destroy
  has_many :posts, dependent: :destroy


end
