Rails.application.routes.draw do
  namespace :staff do
    root 'home#index'
  end
end
