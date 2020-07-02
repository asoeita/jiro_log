class RemoveWatingTimeFromJiros < ActiveRecord::Migration[5.2]
  def change
    remove_column :jiros, :waiting_time, :time
  end
end
