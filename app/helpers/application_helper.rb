module ApplicationHelper
  def full_title(title)
    full_title = "StackHelper"
    if title.empty?
      full_title
    else
      "#{title} - #{full_title}"
    end
  end
end
