class Api::V1::BucketlistItemsController < ApplicationController
before_action :set_trip

 def index
        @bucketlist_item = @trip.bucketlist_item
        render json: @bucketlist_item
    end

 def show
        @bucketlist_item = @trip.bucketlist_item.find_by(id: params[:id])
        render json: @bucketlist_item
    end

  def create
        @bucketlist_item = @trip.bucketlist_item.new(bucketlist_item_params)
        if @bucketlist_item.save
          render json: @trip
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
        params.require(:bucketlist_item).permit(:name, :description, :trip_id)
    end
    def set_trip
      # binding.pry
      # @trip = Trip.find(params[:trip_id])
      unless @trip = Trip.where(id: params[:trip_id]).first
        redirect_to trips_path, flash: {alert: "Trip does not exists!"}
      end
    end

end
