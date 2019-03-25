class StarshipController < ApplicationController
  def show
    response = HTTParty.get("https://swapi.co/api/starships/#{params[:starship_id]}/", format: :plain)
    @starship = JSON.parse(response.body, symbolize_names: true)
    @pilots = []
    @films = []
    
    @starship[:films].each do |film|
      film_id = film.split('/').last.to_i
      response = HTTParty.get("https://swapi.co/api/films/#{film_id}/", format: :plain)
      @films << [film_id , JSON.parse(response.body, symbolize_names: true)]
    end

    @starship[:pilots].each do |pilot|
      pilot_id = pilot.split('/').last.to_i
      response = HTTParty.get("https://swapi.co/api/people/#{pilot_id}/", format: :plain)
      @pilots << [pilot_id , JSON.parse(response.body, symbolize_names: true)]
    end

  end
end
