class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.text :text
      t.integer :answer_father_id
      t.boolean :user_mark_as_right

      t.timestamps
    end
  end
end
