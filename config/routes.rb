Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/', to: 'home#show'
  get '/http_status/:code', to: 'http_status#show'
  get '/delay/:ms', to: 'delay#delay'
  get '/resource/:data', to: 'resource#resource'
  post '/post/json', to: 'post#post_json'

  # Defines the root path route ("/")
  # root "posts#index"
end
