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

  root to: 'welcome#index'
end
