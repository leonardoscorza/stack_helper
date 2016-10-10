class RemoveUserIdFromHashTags < ActiveRecord::Migration[5.0]
	 def up
    remove_column :hashtags, :user_id, :integer
  end

  def down
  	add_column :hashtags, :user_id, :integer
  end
end
