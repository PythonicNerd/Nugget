class PagesController < ApplicationController
  def index
    Rails.application.config.categories = []
    render 'landing_page'
  end

  def loading
    render 'loading'
  end
  
end
