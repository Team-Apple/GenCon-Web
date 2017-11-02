Rails.application.routes.draw do
  get 'dashboard/home'

  root :to => 'dashboard#home'

  resources :events
  resources :announcements
  resources :tasks

  namespace :api do
    get '/event', :to => 'events#get'
    resources :events
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
