class AnswersController < ApplicationController
  before_action :get_answer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy, :new]

  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      flash[:success] = "Resposta criada!"
      redirect_to questions_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private
    def get_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:question_id, :user_id, :text)
    end
end
