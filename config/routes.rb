Rails.application.routes.draw do
  namespace :users do
    get 'edit_passwords/edit'
    get 'edit_passwords/update'
  end
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
