Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: 
  # if Rails.env == 'development'
  #   render status: 200
  # end

  namespace :api do
    namespace :v1 do
      namespace :users do
        post '/register', to: 'register#register'
      end
      namespace :movie do
          post '/submit', to: 'movie#submit'
      end
    end
  end
end
