class QuestionsController < ApplicationController

  def index

    begin
      @categories = Rails.application.config.categories

      @times = Rails.application.config.times
      puts Rails.application.config.times
      puts "TIME"
      @question_array = Rails.application.config.question_array

    rescue
      puts "RESCUE"
      @categories = []
      Rails.application.config.categories = @categories

      Rails.application.config.times = 0


      Rails.application.config.question_array = Question.all.shuffle

      @question_array = Question.all.shuffle
    end


    puts Rails.application.config.times
    puts "^"
    #Rails.application.config.times += 1


    if Rails.application.config.times  >= 10
      Rails.application.config.times = 0
      puts Rails.application.config.times
      puts "TIME^"
     redirect_to swipes_path
    end


    @current_question = Question.all.sample
    puts 'index'

  end

  def show

  end

  def yes
    puts "SWIPED RIGHT"

    question = Rails.application.config.question_array[0]
    puts question.attributes


    Rails.application.config.categories.append(question.rawdata)

    Rails.application.config.question_array.shift




    redirect_to questions_path
  end

  def no

    Rails.application.config.question_array.shift

    redirect_to questions_path

    puts 'no'
end

end
