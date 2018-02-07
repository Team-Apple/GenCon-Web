# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboard/home'
  root to: 'dashboard#home'

  namespace :api do
    resources :events
    resources :announcements
    resources :tasks
    get '/settings/trash', to: 'settings#todays_trash'
  end

  resources :events
  resources :announcements
  resources :tasks
  resources :settings
end
