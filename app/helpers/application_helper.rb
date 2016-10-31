module ApplicationHelper
  # Get title tag content
  def title(title)
    full_title = "StackHelper"
    if title.empty?
      full_title
    else
      "#{title} - #{full_title}"
    end
  end

  # Get desciption to meta description tags
  def description(meta_description)
    if meta_description.empty?
      "O StackHelper é uma comunidade online voltada para programadores, com o objetivo de dividir conhecimento e, até mesmo, permitir que você seja recompensado ($) por isso."
    else
      meta_description
    end
  end

  # Get current absolute url
  def current_url
    request.original_url
  end
end
