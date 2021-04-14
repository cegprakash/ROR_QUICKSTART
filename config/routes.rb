Rails.application.routes.draw do
  get '/api/v1/users(/:page_no)' => 'users#list', :defaults => { :page_no => 1 }
  delete '/api/v1/users/:user_id' => 'users#delete'
  put '/api/v1/users/:user_id' => 'users#update'
  post '/api/v1/users' => 'users#create'
end