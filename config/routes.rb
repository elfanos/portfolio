Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :start
  resources :photos
  resources :albums do
    member do
      patch :desktop_screen_size
    end
  end
  resources :articles

  root 'start#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
