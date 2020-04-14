class ChangeDatatypeUserIdOfJiros < ActiveRecord::Migration[5.2]
  def change
    change_column :jiros, :user_id, :integer, foreign_key: true
  end
end
