class HomeController < ApplicationController

  def index
    @quizzs = Quizz.all
    @exams = Exam.all
  end
end
