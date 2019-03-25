class PeopleController < ApplicationController
  def show
    response = HTTParty.get("https://swapi.co/api/people/#{params[:people_id]}/", format: :plain)
    @character = JSON.parse(response.body, symbolize_names: true)
    @starships = []
    @films = []

    @character[:films].each do |film|
      film_id = film.split('/').last.to_i
      response = HTTParty.get("https://swapi.co/api/films/#{film_id}/", format: :plain)
      @films << [film_id , JSON.parse(response.body, symbolize_names: true)]
    end

    @character[:starships].each do |starship|
      starship_id = starship.split('/').last.to_i
      response = HTTParty.get("https://swapi.co/api/starships/#{starship_id}/", format: :plain)
      @starships << [starship_id , JSON.parse(response.body, symbolize_names: true)]
    end

    homeworld_id = @character[:homeworld].split('/').last.to_i
    response = HTTParty.get("https://swapi.co/api/planets/#{homeworld_id}/", format: :plain)
    @homeworld = [homeworld_id , JSON.parse(response.body, symbolize_names: true)]
  end
end
