class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :trip_id
  has_many :trips
end