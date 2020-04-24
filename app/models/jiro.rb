class Jiro < ApplicationRecord
  belongs_to :user
  belongs_to :store
  mount_uploader :picture, ImageUploader
  has_many :favorites, dependent: :destroy
  has_many :liking_users, through: :favorites, source: :user




end
