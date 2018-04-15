Rails.application.routes.draw do
  namespace :operator do
    root 'home#index'
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'

    resources :staffs
    resources :irregular_offs, only: %i[create destroy] do
      collection do
        get :info
      end
    end
  end
end
