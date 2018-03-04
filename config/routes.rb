Rails.application.routes.draw do

  root "groups#index"
  devise_for :user, controllers: {
    registrations: 'user/registrations',
    sessions: 'user/sessions'
  }
  resources :users_groups, only: [:create, :destroy]
  resources :users, only: [:update, :edit]
  resources :relationships, only: [:new, :show, :create]
  resources :groups do
    collection do
      get 'talking'
    end
    resources :messages, only: [:index, :create]
  end
end
