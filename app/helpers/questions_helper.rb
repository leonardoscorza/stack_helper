module QuestionsHelper
  def first_tag(question)
    Hashtag.find(@question.hashtag_ids.first).name
  end
end
