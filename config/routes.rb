Rails.application.routes.draw do

  root "groups#index"
  devise_for :user, controllers: {
       sessions: 'user/sessions'
  }
  resources :users, only: [:update, :edit]
  resources :relationships, only: [:new, :show, :create]
  resources :groups do
    collection do
      get 'talking'
    end
    resources :messages, only: [:index, :create]
  end
end
