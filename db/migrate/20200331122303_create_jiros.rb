class CreateJiros < ActiveRecord::Migration[5.2]
  def change
    create_table :jiros do |t|
      t.integer :user_id
      t.integer :store_id
      t.string :picture
      t.string :weather
      t.datetime :date
      t.integer :waiting_time
      t.string :call
      t.string :pork
      t.string :soup
      t.text :comment

      t.timestamps
    end
  end
end
