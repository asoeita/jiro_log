class AddFavoriteCountToJiros < ActiveRecord::Migration[5.2]
  def change
    add_column :jiros, :favorite_count, :integer
  end
end
