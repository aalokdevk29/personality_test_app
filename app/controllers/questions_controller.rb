class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :check_ability

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    4.times { @question.question_options.build}
  end

  def create
    @question = Question.new(question_params)
    if @question.save!
      redirect_to @question
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body, question_options_attributes: [:body, :personlity_type])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def check_ability
    redirect_to root_path unless current_user.admin?
  end
end
