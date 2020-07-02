class AddWaitingTimeToJiros < ActiveRecord::Migration[5.2]
  def change
    add_column :jiros, :waiting_time, :datetime
  end
end
