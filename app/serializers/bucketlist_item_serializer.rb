class BucketlistItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :trip_id
  belongs_to :trip
end
