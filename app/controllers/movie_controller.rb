require 'httparty'
require 'json'

class MovieController < ApplicationController
  def index
    response = HTTParty.get('https://swapi.co/api/films/', format: :plain)
    @movies = JSON.parse(response.body, symbolize_names: true)[:results]
    # @movies = HTTParty.get('https://swapi.co/api/films/', format: :plain)
  end

  def show
  end
end
