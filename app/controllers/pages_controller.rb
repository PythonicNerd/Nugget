class PagesController < ApplicationController
  def index
    Rails.application.config.categories = []
    render 'landing_page'
  end

  def loading
    render 'loading'
  end

  def create
    number = params[:how_many][:questions]
    Rails.application.config.number = number
    redirect_to questions_path
  end

end
