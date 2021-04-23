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
        all_comments = Comment.from_user(user['comment']['from_user_id']).to_user(to_user_id).order("created_at DESC").page(1).per(5)
        render json: { comment: all_comments }, status: :ok
    end
end