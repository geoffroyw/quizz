class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy, :validate]

  before_action :authenticate_user!, only: [:new, :edit,:update, :destroy]


  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.all
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
    @checked_answer_ids = []
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
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

    exam_question_ids = @exam.questions.map{|q| q.id}
    exam_question_ids.each do |id|
      unless selected_question_ids.map{|i| i.to_s}.include? id.to_s
        @errors << Question.find(id)
      end
    end

    @checked_answer_ids = @checked_answer_ids.flatten

    render :show
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = Exam.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:intro_text, :name)
    end
end
