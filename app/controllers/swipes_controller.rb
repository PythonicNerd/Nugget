class SwipesController < ApplicationController
  def index
    begin
      RSpotify.authenticate("5fc8d642deb74674848fee0fd969256e", "b5e3187924da4848b8a0183f509fe46e")
    rescue => e
      render 'traffic_error'
    end


  end

  def next

    Rails.application.config.array_of_tracks.shift
    redirect_to swipes_path()
  end


  private

  def get_duration_hrs_and_mins(duration)
    hours = duration / (1000 * 60 * 60)
    minutes = duration / (1000 * 60) % 60

    if hours != 0
      "#{hours} hours and #{minutes} minutes"
    elsif hours == 0
      "#{minutes} minutes"
    end
    rescue
      ""
    end


  end
