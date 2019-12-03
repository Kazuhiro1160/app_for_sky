Rails.application.routes.draw do

  namespace :users do
    resources :edit_passwords, only: [:edit, :update]
  end

  devise_for :users, :controllers => {
      :sessions => 'users/sessions',
      :passwords => 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
