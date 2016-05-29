class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    if !current_user.belongs_to_corral(@question.metric.corral.id)
      redirect_to "/"
      return
    end

    if @question.save
      redirect_to @question.metric
    else
      redirect_to "/"
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if !current_user.belongs_to_corral(@question.metric.corral.id)
      redirect_to "/"
      return
    end

    if @question.update(question_params)
      redirect_to @question.metric
    else
      redirect_to "/"
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    if !current_user.belongs_to_corral(@question.metric.corral.id)
      redirect_to "/"
      return
    end

    @question.destroy
    redirect_to "/"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:sentence, :wanted, :not_wanted, :metric_id, :question_type_id)
    end
end
