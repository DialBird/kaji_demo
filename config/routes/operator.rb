Rails.application.routes.draw do
  namespace :operator do
    root 'home#index'
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'

    resources :staffs
    resources :irregular_offs, only: %i[create destroy]
    resources :clean_orders do
      collection do
        put :assign_staff
      end
    end
  end
end
