class Api::V1::BucketlistItemsController < ApplicationController


 def index
        @bucketlist_item = BucketlistItem.all
        render json: @bucketlist_item
    end

 def show
        @bucketlist_item = BucketlistItem.find_by(id: params[:id])
        render json: @bucketlist_item
    end

  def create
        @bucketlist_item = BucketlistItem.new(bucketlist_item_params)
        if @bucketlist_item.save
          render json: @bucketlist_item
        else
          render json: {error: 'Unable to create a new activity.'}
        end
    end

    def destroy
        @bucketlist_item = BucketlistItem.find(params['id'])
        @trip = Trip.find(@bucketlist_item.destination_id)
        @bucketlist_item.destroy
        render json: @trip
    end

    private
    def bucketlist_item_params
        params.require(:bucketlist_item).permit(:name, :trip_id)
    end


end
