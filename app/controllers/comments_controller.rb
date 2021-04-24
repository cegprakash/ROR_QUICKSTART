class CommentsController < ApplicationController
    def post_comment
        params.require(:user)        
        to_user_id =  params[:to_user_id]
        user = params[:user]
       
        commentRecord = Comment.create({
            :from_user_id =>user['comment']['from_user_id'],
            :to_user_id => to_user_id,
            :comment => user['comment']['comment'],
        })

        render json: {}, status: :ok
    end
end