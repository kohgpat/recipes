Recipes::Application.routes.draw do
  root to: 'recipes#index'

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'recipes#index'
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'recipes#index'
  end

  resource :session

  get 'popular' => 'recipes#popular'

  resources :recipes do
    collection do
      get 'popular'
    end
  end
end
