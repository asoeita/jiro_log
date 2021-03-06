class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :profile_picture, ImageUploader
  validate :picture_size
  has_many :jiros, dependent: :destroy

  #いいね機能
  has_many :favorites, dependent: :destroy
  has_many :like_jiros, through: :favorites, source: :jiro

  private


  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    if profile_picture.size > 5.megabytes
      errors.add(:profile_picture, "should be less than 5MB")
    end
  end

  def current_user?(user)
    user == current_user
  end

end
