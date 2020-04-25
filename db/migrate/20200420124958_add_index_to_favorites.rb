class AddIndexToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_index :favorites, [:user_id, :jiro_id], :unique => true
  end
end
