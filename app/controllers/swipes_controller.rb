class SwipesController < ApplicationController

  def show
    render 'loading'
  end
  def index
    begin

      RSpotify.authenticate("2b801257fdfa4b1c864abb83d9a573fa", "817a4be616634f058e769bdebe11f8ba")


    @genres = Rails.application.config.categories

    @genres = @genres.uniq

    @genres.map!(&:downcase)

    @g_copy = @genres

    joined_genres = []

    @genres.each do |song|
      @genres.each do |song2|
        if song != song2
          combined_song = (song + ' ' + song2).to_s
          joined_genres.push(combined_song)
        end
      end
    end

    puts joined_genres
    puts "joined genres ^"

    @genres += joined_genres

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

  rescue => e
    puts e
    puts "error"
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
