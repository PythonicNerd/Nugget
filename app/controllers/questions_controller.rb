class QuestionsController < ApplicationController

  def index

    begin
      @categories = Rails.application.config.categories
      @times = Rails.application.config.times
    rescue
      puts "RESCUE"
      @categories = []
      Rails.application.config.categories = @categories

      Rails.application.config.times = 0

      @times = Rails.application.config.times
    end



    Rails.application.config.times += 1

    if Rails.application.config.times  >= 6
      redirect_to swipes_path
      puts "GREAT"
    end

    puts @times

    @current_question = Question.all.sample

  end

  def show

  end

  def yes
    puts "SWIPED RIGHT"

    question = Question.find(params[:question_id])
    Rails.application.config.categories.append(question.rawdata)




    redirect_to questions_path
  end
end
