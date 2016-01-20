class HomeController < ApplicationController

  def index
    @quizzs = Quizz.all.order :id
    @exams = Exam.all.order :id
  end
end
