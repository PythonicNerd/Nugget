class QuestionsController < ApplicationController

  def index

    begin
      @categories = Rails.application.config.categories
      @times = Rails.application.config.times
      @question_array = Rails.application.config.question_array

    rescue
      puts "RESCUE"
      @categories = []
      Rails.application.config.categories = @categories

      Rails.application.config.times = 0

      @times = Rails.application.config.times

      Rails.application.config.question_array = Question.all.shuffle

      @question_array = Rails.application.config.question_array
    end



    Rails.application.config.times += 1

    if Rails.application.config.times  >= 10
      redirect_to swipes_path
    end


    @current_question = Question.all.sample

  end

  def show

  end

  def yes
    puts "SWIPED RIGHT"

    question = Question.find(params[:question_id])
    Rails.application.config.categories.append(question.rawdata)

    Rails.application.config.question_array.shift




    redirect_to questions_path
  end

  def no

    Rails.application.config.question_array.shift

    redirect_to questions_path
end

end
