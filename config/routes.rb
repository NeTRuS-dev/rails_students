Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }, only: %i[sessions registrations]
  match '/users/get-all', to: 'home#get_users', via: %i[get post]

  root to: 'home#index'
end
