Rails.application.routes.draw do
  namespace :staff do
    root 'home#index'
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
    get 'account' => 'staff#show'
    get 'edit' => 'staff#edit'
    put 'account' => 'staff#update'
  end
end
