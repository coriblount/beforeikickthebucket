class Api::V1::TripsController < ApplicationController
    # before_action :set_trip, only: [:show, :create, :update, :destroy]
    skip_before_action :authorized

    def index
        @trips = Trip.all
        render json: @trips
    end

        def show 
            render json: @trip
        end
    
        def create
            @trip = Trip.create(trip_params)
                render json: @trip
            
        end
    
    def update
        @trip = Trip.find(params[:id])
            @trip.update(trip_params)
            # @trip.save
            render json: @trip
    end
    
    def destroy
        @trip = Trip.find_by(trip_params)
        @trip.destroy
        render json: @trip
    end

    private
    def trip_params
        params.require(:trip).permit(:id, :name, :destination, :visited, :bucketlist)
    end
    
    # def set_trip
    #     @trip = Trip.find(params[:id])
    # end
    
end
