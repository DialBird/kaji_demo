Rails.application.routes.draw do
  namespace :staff do
    root 'home#index'
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
  end
end
