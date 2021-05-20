class Trip < ApplicationRecord
    has_many :bucketlist_items
    belongs_to :user
end
