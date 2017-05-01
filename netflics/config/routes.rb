Rails.application.routes.draw do
  get 'static_pages/new'
  get 'sessions/new'

  root      'static_pages#home'
  get       '/signup',           to: 'users#new'
  post      '/signup',           to: 'users#create'
  get       '/login',            to: 'sessions#new'
  post      '/login',            to: 'sessions#create'
  delete    '/logout',           to: 'sessions#destroy'
  get       '/show_all_series',  to: 'series#show_all'
  get       '/show_all_seasons', to: 'seasons#show_all'
  get       '/show_all_episodes',to: 'episodes#show_all'
  get	      'manage_children',   to: 'users#children'
  get	      'new_child',         to: 'users#new_child'
  post      'new_child',         to: 'users#create_child'
  # temporary
  post       'make_admin',       to: 'users#make_admin'
  post       'not_admin',        to: 'users#not_admin'
  # end temporary


  resources :actors
  resources :directors
  resources :episodes
  resources :seasons
  resources :series
  resources :children
  resources :roles
  resources :users
  resources :parentchildren

end
