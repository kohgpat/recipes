Recipes::Application.routes.draw do
  root to: 'recipes#index'

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'recipes#index'
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'recipes#index'
  end

  resources :passwords,
    :controller => 'clearance/passwords',
    :only => [:create, :new]

  resource :session,
    :controller => 'clearance/sessions',
    :only => [:create]

  resources :users,
    :controller => 'clearance/users',
    :only => [:create] do
      resource :password,
        :controller => 'clearance/passwords',
        :only => [:create, :edit, :update]
    end

  get '/sign_in' => 'clearance/sessions#new', :as => 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', :as => 'sign_out'
  get '/sign_up' => 'clearance/users#new', :as => 'sign_up'

  resource :session

  resources :profiles, only: [:show]

  get 'popular' => 'recipes#popular'

  resources :recipes do
    collection do
      get 'popular'
    end
  end

  get ':id' => 'profiles#show'
end
