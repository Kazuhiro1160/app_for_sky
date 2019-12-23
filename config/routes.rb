Rails.application.routes.draw do

  root 'user_mains#edit'
  get 'errors/index'

  devise_for :admins, :controllers => {

  }

  devise_for :users, :controllers => {
      :sessions => 'users/sessions',
      :passwords => 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :users do
    resources :edit_passwords, only: [:edit, :update]
    resources :user_infos, only:[:edit, :update]
    resources :user_mains, only:[:edit, :update]
  end

  resources :users do
    resources :threads, shallow: true, only: :show
    resources :timelines, shallow: true, only: [:new, :create, :destroy]
  end

  # mount ActionCable.server => '/cable'
end
