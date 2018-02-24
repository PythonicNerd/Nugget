class QuestionsController < ApplicationController

  def index

    begin
      @categories = Rails.application.config.categories
    rescue
      @categories = nil
    end
    puts Question.all[0].attributes

    @current_question = Question.all.sample

  end

  def show

  end

  def swipe_right
    puts "SWIPED RIGHT"

    question = Question.find(params[:question_id])



    redirect_to questions_path
  end
end
