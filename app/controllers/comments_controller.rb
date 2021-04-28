class CommentsController < ApplicationController
    def post_comment
        params.require(:user)        
        to_user_id =  params[:to_user_id]
        user = params[:user]
       
        # commentRecord = Comment.create({
        #     :from_user_id =>user['comment']['from_user_id'],
        #     :to_user_id => to_user_id,
        #     :comment => user['comment']['comment'],
        # })

        logged_in_user = User.find_by_id(user['comment']['from_user_id'])

        if logged_in_user
            user_comment = logged_in_user.comments_posted.create()
            user_comment.to_user = User.find_by_id(to_user_id)
            user_comment.comment = user['comment']['comment']
            user_comment.save
        end

        render json: {}, status: :ok
    end
end
