class Jiro < ApplicationRecord
  belongs_to :user
  belongs_to :store
  mount_uploader :picture, ImageUploader
  has_many :favorites, dependent: :destroy
  has_many :like_users, through: :favorites, source: :user


# 二郎投稿に良いねする
  def like(user)
    favorites.create(user_id: user.id)
  end

  def unlike(user)
    favorites.find_by(user_id: user.id).destroy
  end

  def like?(user)
      like_users.include?(user)
  end


end
