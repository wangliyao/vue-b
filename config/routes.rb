Rails.application.routes.draw do
  namespace :api, defaults: {format: :json}, except: %i[new edit] do
    namespace :v1 do
      resources :home do
        collection do
          get :list
        end
      end
      resources :categories do
        collection do
          get :list
          get :search
        end
      end
      resources :mac_vods do
        member do
          get :recommend
        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
