Rails.application.routes.draw do
  get 'users/list' => 'users#list'
  get 'users' => 'users#index'
end