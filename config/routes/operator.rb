Rails.application.routes.draw do
  namespace :operator do
    root 'home#index'
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'

    resources :staffs
  end
end
