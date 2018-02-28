Rails.application.routes.draw do
  devise_for :user, controllers: {
       sessions: 'user/sessions'
  }
  resources :users, except: [:create]
  resources :relationships
  resources :groups
  root "relationships#index"
  resources :talk_rooms, except: [:update, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
