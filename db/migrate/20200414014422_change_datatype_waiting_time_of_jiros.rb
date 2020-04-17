class ChangeDatatypeWaitingTimeOfJiros < ActiveRecord::Migration[5.2]
  def change
    change_column :jiros, :waiting_time, :time
  end
end
