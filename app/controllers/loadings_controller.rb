class LoadingsController < ApplicationController
  def index
    render 'loading'
  end

  def load
    redirect_to swipes_path
  end
end
