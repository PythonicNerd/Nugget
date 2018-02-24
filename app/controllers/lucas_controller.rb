class LucasController < ApplicationController
  def make
    #write the stuff here boyo

    a = Question.new
    a.title = "Enter the queston here my man"
    a.option1 = "Enter the first option (this option will always be yes)"
    a.option2 = "Enter the second option"
    a.rawdata = "Enter the genre this question will save for if the user selects option 1 (for example if the question is 'do you like metal?' than the rawdata will be 'Metal')"
    b = Qustion.new
    b.title = "Are you edgy, and like heavy Metal"
    b.option1 = "HE'LL YEAH MA DUDE"





  end

end
