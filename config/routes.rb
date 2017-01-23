Rails.application.routes.draw do
  root 'states#index'
  resources :states, :bills, :people, :users, :votes
  post '/searches/' => 'searches#search', :as => 'searches'

  namespace :v1, defaults: { format: :json } do
    resources :bills
    resources :people
    resources :votes
    resources :states
    resources :users
  end
end
