Rails.application.routes.draw do

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
    resources :posts
    resources :timelines, only: :show
  end
end
