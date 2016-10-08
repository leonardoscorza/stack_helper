class RenameTextToNameInHashtags < ActiveRecord::Migration[5.0]
	def up
    rename_column :hashtags, :text, :name
  end

  def down
    rename_column :hashtags, :name, :text
  end
end
