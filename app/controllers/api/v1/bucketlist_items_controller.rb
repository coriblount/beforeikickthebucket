class Api::V1::BucketlistItemsController < ApplicationController
# before_action :set_trip
skip_before_action :authorized

# t.string "name"
# t.string "description"
# t.integer "rating"
# t.integer "trip_id"

 def index
    @bucketlist_item = BucketlistItem.all
        # @bucketlist_item = @trip.bucketlist_item
        render json: @bucketlist_item
    end

 def show
        @bucketlist_item = @trip.bucketlist_items.find_by(id: params[:id])
        render json: @bucketlist_item
    end

  def create
        name = params[:bucketlist_item][:name]
        description = params[:bucketlist_item][:description]
        trip_id = params[:bucketlist_item][:tripObject][:id]
        @bucketlist_item = BucketlistItem.new(name: name, description: description, trip_id: trip_id)
        if @bucketlist_item.save
          render json: @bucketlist_item
        else
          render json: {error: 'Unable to create a new activity.'}
        end
    end



    def destroy
        @bucketlist_item = BucketlistItem.find(params['id'])
        @trip = Trip.find(@bucketlist_item.trip_id)
        @bucketlist_item.destroy
        render json: @trip
    end

    private
    def bucketlist_item_params
        params.require(:bucketlist_item).permit(:id, :name, :description, :trip_id)
    end


    def set_trip
      # binding.pry
      # @trip = Trip.find(params[:trip_id])
      unless @trip = Trip.where(id: params[:trip_id]).first
        redirect_to trips_path, flash: {alert: "Trip does not exists!"}
      end
    end

end
