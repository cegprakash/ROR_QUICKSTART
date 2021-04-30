class Api::V1::UsersController < ApplicationController
    def update
        params.require(:name)
        user = User.find(params[:id])
        if user
            user.update(name: params[:name])
            render json: user, status: :ok
            return
        end
        render json: {}, status: :not_found
    end

    def create
        params.require(:name)
        user = User.create({:name => params[:name]})
        render json: user, status: :ok
    end

    def index
        @users = User.page(params[:page_no]).per(5)
        # render json: @users, root: 'users', each_serializer: UserSerializer, status: :ok
        render json: { user: @users }, status: :ok
        # render 'users/list'
    end

    def show
        # user = User.find_by_id(params[:user_id]).as_json
        # all_comments = Comment.where('to_user_id = %d' % [params[:user_id]]).eager_load(:from_user).order("comments.created_at DESC").page(1).per(5)
        user = User.includes({comments_received: :from_user}).where('users.id = %d' % [params[:id]]).order("comments.created_at DESC")        
        if user.length
            render json: user[0], status: :ok, serializer: UserSerializer, adapter: :json, include: {comments_received: [:from_user]}            
        else
            render json: {}, status: :not_found
        end
    end

    def destroy
        User.delete(params[:id])
        render json: {}, status: :no_content
    end
end