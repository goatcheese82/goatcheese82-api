class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :email, :uid
end
