class QuizzsController < ApplicationController
  before_action :set_quizz, only: [:show, :edit, :update, :destroy, :validate]

  before_action :authenticate_user!, only: [:new, :edit,:update, :destroy]


  # GET /quizzs
  # GET /quizzs.json
  def index
    @quizzs = Quizz.all
  end

  # GET /quizzs/1
  # GET /quizzs/1.json
  def show
    @checked_answer_ids = []
  end

  # GET /quizzs/new
  def new
    @quizz = Quizz.new
  end

  # GET /quizzs/1/edit
  def edit
  end

  def validate
    @errors = []
    @checked_answer_ids = []

    selected_question_ids = params[:question].nil? ? [] : params[:question].keys
    selected_question_ids.each do |id|
      valid_answer_for_question = Answer.where('question_id = ? and is_correct = ?', id, true)
      selected_answers = Answer.find(params[:question][id]['answer_ids'])
      @checked_answer_ids << selected_answers.map{|a| a.id}
      unless valid_answer_for_question.uniq.sort == selected_answers.uniq.sort
        @errors << Question.find(id)
      end

    end

    quizz_question_ids = @quizz.questions.map{|q| q.id}
    quizz_question_ids.each do |id|
      unless selected_question_ids.map{|i| i.to_s}.include? id.to_s
        @errors << Question.find(id)
      end
    end

    @checked_answer_ids = @checked_answer_ids.flatten

    render :show
  end

  # POST /quizzs
  # POST /quizzs.json
  def create
    @quizz = Quizz.new(quizz_params)

    respond_to do |format|
      if @quizz.save
        format.html { redirect_to quizz_questions_path(@quizz), notice: t('quizz.save.success') }
        format.json { render :show, status: :created, location: @quizz }
      else
        format.html { render :new }
        format.json { render json: @quizz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzs/1
  # PATCH/PUT /quizzs/1.json
  def update
    respond_to do |format|
      if @quizz.update(quizz_params)
        format.html { redirect_to @quizz, notice: t('quizz.save.success') }
        format.json { render :show, status: :ok, location: @quizz }
      else
        format.html { render :edit }
        format.json { render json: @quizz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzs/1
  # DELETE /quizzs/1.json
  def destroy
    @quizz.destroy
    respond_to do |format|
      format.html { redirect_to quizzs_url, notice: t('quizz.delete.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quizz
      @quizz = Quizz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quizz_params
      params.require(:quizz).permit(:intro_text, :name)
    end
end
