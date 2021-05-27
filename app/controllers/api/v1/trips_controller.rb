class Api::V1::TripsController < ApplicationController

    def index
        @trips = Trip.all
        render json: @trips
    end

        def show 
            render json: @trip
        end
    
        def create
            @trip = Trip.new(trip_param)
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
    
    def set_trip
        @trip = Trip.find_by(params[:id])
    end
    
end
