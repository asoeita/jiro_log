class Store < ApplicationRecord
  has_one :jiro, dependent: :destroy
end
