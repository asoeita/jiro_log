class ChangeDatatypeStoreIdOfJiros < ActiveRecord::Migration[5.2]
  def change
    change_column :jiros, :store_id, :integer, foreign_key: true
  end
end
