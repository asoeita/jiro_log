class Jiro < ApplicationRecord
  belongs_to :user
  has_one :store
  mount_uploader :picture, ImageUploader

end
