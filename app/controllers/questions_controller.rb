class QuestionsController < ApplicationController

  def index


    begin
      @categories = Rails.application.config.categories


      @question_array = Rails.application.config.question_array
      @number = Rails.application.config.number
      @loading = false

    rescue => e
      puts e
      Rails.application.config.categories = []
      Rails.application.config.question_array = Question.all.shuffle
      @loading = false
    end


    puts       Rails.application.config.categories


    puts (Question.all.length - Rails.application.config.question_array.length)
    puts 'times'
    puts Rails.application.config.number
    puts '^ number'

    if Rails.application.config.question_array[0] == nil
      Rails.application.config.categories = Rails.application.config.categories.uniq


      Rails.application.config.question_array = (Question.all.shuffle - Rails.application.config.categories)
      puts Rails.application.config.question_array
      puts "New Array"
    end

    if (Question.all.length - Rails.application.config.question_array.length) >= Rails.application.config.number.to_i

      @loading = true

     Rails.application.config.question_array = []
     #redirect_to loadings_path
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

    if not @loading
      redirect_to questions_path
    end
  end

  def no

    Rails.application.config.question_array.shift

    if not @loading
      redirect_to questions_path
  end
end


end
