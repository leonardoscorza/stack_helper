class RenameQuestionsHashtags < ActiveRecord::Migration[5.0]
	def self.up
    rename_table :questions_hashtags, :hashtags_questions
  end

  def self.down
    rename_table :hashtags_questions, :questions_hashtags
  end
end
