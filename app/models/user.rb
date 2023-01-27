class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :database_authenticatable, authentication_keys: [:email]

  has_one_attached :user_image

  has_many :memories, through: :memory_users
  has_many :memory_users
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

end
