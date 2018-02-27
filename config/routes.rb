Rails.application.routes.draw do
  devise_for :user, controllers: {
       sessions: 'user/sessions'
  }
  # namespace :user do
  # end
  root "talk_rooms#index"
  resources :talk_rooms, except: [:update, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
