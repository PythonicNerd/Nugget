class PagesController < ApplicationController
  def index
    Rails.application.config.categories = []
    render 'landing_page'
  end

end
