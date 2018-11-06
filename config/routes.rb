Rails.application.routes.draw do
  devise_for :users

  root to: "matches#index"

  namespace :admin do
    resources :matches, except: [:show] do
      resources :game_results, except: [:show, :destroy]
    end
  end

  resources :matches do
    resources :scores
  end

  resources :profile, except: [:destroy, :index]
  resources :results, only: [:index] do
    collection do
      get :positions
    end
  end

end
