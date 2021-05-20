class TripsController < ApplicationController
    belongs_to :user
    has_many :bucketlist_items
end
