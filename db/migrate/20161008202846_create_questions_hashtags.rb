class CreateQuestionsHashtags < ActiveRecord::Migration[5.0]
  def change
    create_table :questions_hashtags, :id => false do |t|
      t.references :question, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true
    end
  end
end
