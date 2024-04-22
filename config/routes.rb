Rails.application.routes.draw do
  get 'rooms/index'
  # get 'users/show'  
  root to: 'homes#top'
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  devise_for :users, path: 'users', controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }

  resources :users, only: :show
  resources :rooms 
  resources :reservations, only: [:new, :create, :index]
  
  post 'reservations/confirm', to: 'reservations#confirm', as: 'confirm_reservation'

  delete 'rooms/:id/delete', to: 'rooms#destroy', as: 'delete_room'
end


