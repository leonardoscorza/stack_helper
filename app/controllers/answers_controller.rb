class AnswersController < ApplicationController
  before_action :get_answer, only: [:update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def create
    answer = current_user.answers.build(answer_params)
    if answer.save
      ActionCable.server.broadcast 'answers',
        answer: answer.text,
        user: answer.user.name
      head :ok
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    @answer.destroy
  end

  private
    def get_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:user_id, :question_id, :text)
    end
end
