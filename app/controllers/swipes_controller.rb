class SwipesController < ApplicationController
  def index
    RSpotify.authenticate("5fc8d642deb74674848fee0fd969256e", "b5e3187924da4848b8a0183f509fe46e")


    Rails.application.config.times = 0
    @genres = Rails.application.config.categories

    @genres = @genres.uniq

    @genres.map!(&:downcase)

    recommendations = RSpotify::Recommendations.generate(seed_genres: @genres)

    @array_of_tracks = []

    recommendations.tracks.each do |track|
      h = Hash.new

      h[:name] = track.name
      h[:artist] = track.artists[0].name
      h[:duration] = get_duration_hrs_and_mins(track.duration_ms).to_s
      h[:url] = track.preview_url

      if h[:url] != nil
        @array_of_tracks.push(h)
      end

    end

    Rails.application.config.array_of_tracks = @array_of_tracks

    Rails.application.config.question_array = []


    puts @array_of_tracks

    puts @genres
    puts "^^^^"


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
      "#{hours}h #{minutes}m"
    elsif hours == 0
      "#{minutes}m"
    end
    rescue
      ""
    end


  end
