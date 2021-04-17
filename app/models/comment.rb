class Comment < ApplicationRecord
    scope :from_user, -> (from_user_id) {where(from_user_id: from_user_id)}
    scope :to_user, -> (to_user_id) {where(to_user_id: to_user_id)}
end
