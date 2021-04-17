class UserSerializer < ActiveModel::Serializer
  type :user
  attributes :id, :name 
end
