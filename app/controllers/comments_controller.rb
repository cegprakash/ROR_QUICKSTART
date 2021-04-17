class CommentsController < ApplicationController
    def post_comment
        params.require(:from_user_id)
        params.require(:to_user_id)
        params.require(:comment)
        from_user_id = params[:from_user_id]
        to_user_id =  params[:to_user_id]
        comment = params[:comment]
        commentRecord = Comment.create({
            :from_user_id => from_user_id,
            :to_user_id => to_user_id,
            :comment => comment,
        })
        all_comments = Comment.from_user(from_user_id).to_user(to_user_id).order("created_at DESC").page(1).per(5)
        render json: { comment: all_comments }, status: :ok
    end
end