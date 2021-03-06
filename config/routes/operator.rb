Rails.application.routes.draw do
  namespace :operator do
    root 'home#index'
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'

    resources :staffs do
      get :search, on: :collection
    end
    resources :irregular_offs, only: %i[create destroy]
    resources :clean_orders, only: %i[index show] do
      collection do
        put :assign_staff
      end
    end
  end
end
