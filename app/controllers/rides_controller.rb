class RidesController < ApplicationController
    def go_on_ride
        # binding.pry
        ride = Ride.find_or_create_by(attraction_id: params[:id], user_id: current_user.id)
        notice = ride.take_ride
        flash[:notice] = notice
        redirect_to user_path(current_user)   
    end
end
