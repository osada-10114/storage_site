Rails.application.routes.draw do

  resources :comments
  devise_for :users, controllers: {
  	sessions: 		 'users/sessions',
  	passwords: 		 'users/passwords',
  	registrations: 'users/registrations'
  }
  resources :users, only: [:index, :edit, :update, :show] do
    resource :relationships, only: [:create, :destroy]
    get :favorites, on: :member
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
  root 'home#index'
  delete '/user_destroy' => 'users#user_destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
