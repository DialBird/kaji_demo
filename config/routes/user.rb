Rails.application.routes.draw do
  namespace :user do
    root 'home#index'
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
    get 'account' => 'user#show'
    get 'edit' => 'user#edit'
    put 'account' => 'user#update'
  end
end
