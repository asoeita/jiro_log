class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :jiro, counter_cache: :favorites_count
  validates :user_id, {presence: true}
  validates :jiro_id, {presence: true}
  validates :jiro_id, uniqueness: {scope: :user_id}
end
