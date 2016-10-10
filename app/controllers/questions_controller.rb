class QuestionsController < ApplicationController
  before_action :get_question, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, only: [:create, :update, :destroy]


  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:info] = "Questão criada!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    if @question.update_attributes(question_params)
      flash[:success] = "Questão atualizada!"
      redirect_to @question
    else
      # TODO
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "Questão deletada!"
    redirect_to root_url
  end

  def show
    @user = @question.user
  end

  private

    def get_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :text, :user_id,:tag_body)
    end
end
