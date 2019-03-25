Rails.application.routes.draw do
  get '/planet/:planet_id', to: 'planet#show', as: :planet_show
  get '/people/:people_id', to: 'people#show', as: :people_show
  get '/starship/:starship_id', to: 'starship#show', as: :starship_show
  get '/movie/:episode_id', to: 'movie#show', as: :movie_show
  get '/movies', to: 'movie#index'
  root to: 'movie#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
