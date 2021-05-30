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
            @trip = Trip.new(trip_params)
            if @trip.save
                render json: @trip
            else
                render json: {error: "cannot create trip" }
        end
    end
    
    def update
        if @trip.update(trip_params)
            @trip.save
            render json: @trip
        else
            render json: {error: "cannot edit trip"}
        end
    end
    
    def destroy
        @trip.destroy
        render json: @trip
    end

    private
    def trip_params
        params.require(:trip).permit(:id, :name, :destination, :visited, :bucket_list)
    end
    
    # def set_trip
    #     @trip = Trip.find(params[:id])
    # end
    
end
