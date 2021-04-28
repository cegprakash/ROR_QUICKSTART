Rails.application.routes.draw do  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show, :update, :destroy] do
        resources :comments, only: [:create]
      end
    end
  end
end

# Rails.application.routes.draw do  
#   get '/api/v1/users' => 'users#list'
#   get '/api/v1/users/:user_id' => 'users#get_user'
#   delete '/api/v1/users/:user_id' => 'users#delete'
#   put '/api/v1/users/:user_id' => 'users#update'
#   post '/api/v1/users' => 'users#create'
#   post '/api/v1/users/:to_user_id/comments' => 'comments#post_comment'
# end
