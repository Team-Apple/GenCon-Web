Rails.application.routes.draw do
  get 'dashboard/home'

  namespace :api do
    resources :events
    resources :announcements
  end

  root :to => 'dashboard#home'

  resources :events
  resources :announcements
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
