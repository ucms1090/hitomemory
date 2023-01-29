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

  def get_user_image(width, height)
    unless user_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_user.png')
      user_image.attach(io: File.open(file_path), filename: 'default-user-image.png', content_type: 'image/jpeg')
    end
    user_image.variant(resize_to_limit: [width, height]).processed
  end

end
