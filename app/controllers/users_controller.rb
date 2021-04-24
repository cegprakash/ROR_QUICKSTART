class UsersController < ApplicationController
    def update
        params.require(:name)
        user = User.find(params[:user_id])
        if user
            user.update(name: params[:name])
            render json: {}, status: :ok
            return
        end
        render json: {}, status: :not_found
    end

    def create
        params.require(:name)
        user = User.create({:name => params[:name]})
        render json: user, status: :ok
    end

    def list
        @users = User.page(params[:page_no]).per(5)
        # render json: @users, root: 'users', each_serializer: UserSerializer, status: :ok
        render json: { user: @users }, status: :ok
        # render 'users/list'
    end

    def get_user
        user = User.where('id = %d' % [params[:user_id]]).eager_load('comments_received')
        #user = User.find_by_id(params[:user_id]).as_json

        if user
            #all_comments = Comment.where('to_user_id = %d' % [params[:user_id]]).eager_load(:from_user).order("comments.created_at DESC").page(1).per(5)

            #puts(user.comments_received)

            #user = user.merge({'comments_received'=> all_comments})

            render json: { user: user.as_json }, status: :ok
        else
            render json: {}, status: :not_found
        end
    end

    def delete
        User.delete(params[:user_id])
        render json: {}, status: :no_content
    end
end