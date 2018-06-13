# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :reminders

    root to: 'users#index'
  end

  resources :reminders

  post 'reminders/:id/refresh',
       to: 'reminders#refresh',
       as: :refresh_reminder

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'reminders#index'
end
