class RidesController < ApplicationController
    # def index
    #     redirect_to user_path(current_user)
    # end

    def create
        # byebug
        ride = Ride.create(ride_params)
        flash[:notice] = ride.take_ride

        redirect_to user_path(current_user)
    end

    private
    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end
