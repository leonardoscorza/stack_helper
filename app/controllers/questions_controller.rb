class QuestionsController < ApplicationController
  before_action :get_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy, :new]

  def index
    @questions = Question.all
  end

  def new
    #@question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Questão criada!"
      redirect_to @question
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @question.update_attributes(question_params)
      flash[:success] = "Questão atualizada!"
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "Questão deletada!"
    redirect_to questions_url
  end

  def show
    @user = @question.user
    @answers = @question.answers
  end

  private

    def get_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :text, :user_id, :tag_body)
    end
end
