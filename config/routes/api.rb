Rails.application.routes.draw do
  namespace :api do
    get 'staff_schedules' => 'staff_schedules#info'
  end
end
