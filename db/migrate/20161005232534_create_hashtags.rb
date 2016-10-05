class CreateHashtags < ActiveRecord::Migration[5.0]
  def change
    create_table :hashtags do |t|
      t.string :text
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
