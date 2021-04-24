class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :comments_received, serializer: CommentSerializer, include: true
  # def comments_received
  #   ActiveModel::SerializableResource.new(object.comment,  each_serializer: CommentSerializer)
  # end
end
