class Jiro < ApplicationRecord
  belongs_to :user
  belongs_to :store
  mount_uploader :picture, ImageUploader

end
