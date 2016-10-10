class AddTagsToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :tag, :string
  end
end
