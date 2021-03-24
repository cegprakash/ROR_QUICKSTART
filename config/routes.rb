Rails.application.routes.draw do
  get 'users(/:page_no)' => 'users#list', :defaults => { :page_no => 1 }
  delete 'users/:user_id' => 'users#delete'
  put 'users/:user_id' => 'users#update'
  post 'users' => 'users#create'
end