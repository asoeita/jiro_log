class RenameFavoriteCountColumnToJiros < ActiveRecord::Migration[5.2]
  def change
    rename_column :jiros, :favorite_count, :favorites_count
  end
end
