class User < ApplicationRecord
    has_many :'comments_received', :class_name => 'Comment', :inverse_of => :to_user, foreign_key: :to_user_id
    has_many :'comments_posted', :class_name => 'Comment', :inverse_of => :from_user, foreign_key: :from_user_id
end
