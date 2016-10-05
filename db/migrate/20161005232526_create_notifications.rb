class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :hashtag_id
      t.integer :user_id
      t.integer :frequency

      t.timestamps
    end
  end
end
