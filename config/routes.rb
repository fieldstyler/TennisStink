Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      namespace :matches do
        get "/player/:id", to: 'player#index'
      end

      resources :players
      resources :matches
    end
  end
end
