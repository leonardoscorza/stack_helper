class RemoveQuestionIdFromHashtags < ActiveRecord::Migration[5.0]
  def up
    remove_column :hashtags, :question_id, :integer
  end

  def down
    add_column :hashtags, :question_id, :integer
  end
end
