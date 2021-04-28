class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :created_at
  belongs_to :from_user #, include: true
  # belongs_to :from_user, serializer: UserSerializer, include: false
  # def from_user
  #   ActiveModel::SerializableResource.new(object.user,  each_serializer: UserSerializer)
  # end

end
