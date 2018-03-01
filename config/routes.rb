Rails.application.routes.draw do

  root "groups#index"
  devise_for :user, controllers: {
       sessions: 'user/sessions'
  }
  resources :users, except: [:create]
  resources :relationships
  resources :groups do
    member do
      get 'talking'
    end
    resources :messages, only: [:index, :create]
  end
end
