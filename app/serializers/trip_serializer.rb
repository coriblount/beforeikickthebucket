class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :destination, :start_date, :end_date, :visited, :bucketlist, :user_id
  belongs_to :user
  has_many :bucketlist_items
end
