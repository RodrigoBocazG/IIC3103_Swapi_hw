class PlanetController < ApplicationController
  def show
    response = HTTParty.get("https://swapi.co/api/planets/#{params[:planet_id]}/", format: :plain)
    @planet = JSON.parse(response.body, symbolize_names: true)

    @residents = []
    @films = []
    
    @planet[:films].each do |film|
      film_id = film.split('/').last.to_i
      response = HTTParty.get("https://swapi.co/api/films/#{film_id}/", format: :plain)
      @films << [film_id , JSON.parse(response.body, symbolize_names: true)]
    end

    @planet[:residents].each do |resident|
      resident_id = resident.split('/').last.to_i
      response = HTTParty.get("https://swapi.co/api/people/#{resident_id}/", format: :plain)
      @residents << [resident_id , JSON.parse(response.body, symbolize_names: true)]
    end
  end
end
