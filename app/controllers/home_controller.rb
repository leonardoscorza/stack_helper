class HomeController < ApplicationController
  def index
    @questions = Question.all
  end

  def about
  end
end
