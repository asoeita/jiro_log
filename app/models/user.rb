class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :profile_picture, ImageUploader
  validate :picture_size
  has_many :jiros, dependent: :destroy

  private


  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    if profile_picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
