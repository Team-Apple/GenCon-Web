Rails.application.routes.draw do
  get 'dashboard/home'

  resources :events
  resources :announcements
  resources :tasks

  root :to => 'dashboard#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
