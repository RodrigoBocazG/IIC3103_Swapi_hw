require 'httparty'
require 'json'

class MovieController < ApplicationController
  def index
    # Get all films
    response = HTTParty.get('https://swapi.co/api/films/', format: :plain)
    # Parse json response to hash
    @movies = JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def show
    response = HTTParty.get("https://swapi.co/api/films/#{params[:episode_id]}/", format: :plain)
    @movie = JSON.parse(response.body, symbolize_names: true)
    @planets = []
    @starships = []
    @characters = []

    @movie[:planets].each do |planet|
      planet_id = planet.split('/').last.to_i
      response = HTTParty.get("https://swapi.co/api/planets/#{planet_id}/", format: :plain)
      @planets << [planet_id , JSON.parse(response.body, symbolize_names: true)]
    end

    @movie[:starships].each do |starship|
      starship_id = starship.split('/').last.to_i
      response = HTTParty.get("https://swapi.co/api/starships/#{starship_id}/", format: :plain)
      @starships << [starship_id , JSON.parse(response.body, symbolize_names: true)]
    end

    @movie[:characters].each do |character|
      character_id = character.split('/').last.to_i
      response = HTTParty.get("https://swapi.co/api/people/#{character_id}/", format: :plain)
      @characters << [character_id , JSON.parse(response.body, symbolize_names: true)]
    end

  end
end
