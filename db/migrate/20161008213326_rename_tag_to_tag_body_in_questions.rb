class RenameTagToTagBodyInQuestions < ActiveRecord::Migration[5.0]
	def up
    rename_column :questions, :tag, :tag_body
  end

  def down
    rename_column :questions, :tag_body, :tag
  end
end
