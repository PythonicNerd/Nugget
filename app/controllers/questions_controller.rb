class QuestionsController < ApplicationController

  def index


    begin
      @categories = Rails.application.config.categories


      @question_array = Rails.application.config.question_array

    rescue => e
      puts e
      Rails.application.config.categories = []
      Rails.application.config.question_array = Question.all.shuffle
end


    puts       Rails.application.config.categories


    puts (Question.all.length - Rails.application.config.question_array.length)
    puts 'times'
    if Rails.application.config.question_array[0] == nil
      Rails.application.config.question_array = Question.all.shuffle
    end

    if (Question.all.length - Rails.application.config.question_array.length) == 5
      Rails.application.config.question_array = []
     redirect_to swipes_path
    end


  end


  def yes

    begin
      question = Rails.application.config.question_array[0]
      Rails.application.config.categories.append(question.rawdata)

      Rails.application.config.question_array.shift



    rescue
    end

    redirect_to questions_path
  end

  def no

    Rails.application.config.question_array.shift

    redirect_to questions_path
end


end
