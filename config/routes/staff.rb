Rails.application.routes.draw do
  namespace :staff do
    root 'home#index'
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
    get 'account' => 'staff#show'
    get 'edit' => 'staff#edit'
    put 'account' => 'staff#update'

    resources :clean_orders, only: %i[index show].freeze do
      member do
        put :accept
        put :refuse
      end
    end
  end
end
