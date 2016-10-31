module QuestionsHelper
  def first_tag(question)
    Hashtag.find(@question.hashtag_ids.first).name
  end

  def truncate_question_text(text)
    truncate(text, :length => 200, :separator => ' ')
  end
end
