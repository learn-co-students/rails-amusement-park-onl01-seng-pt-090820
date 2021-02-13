class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]
  def index
    @admin = User.find_by(id: params[:id], admin: true)
    @attractions = Attraction.all
  end
  def show

  end

  def new
    if !current_user.admin
      redirect_to attractions_path
    end
    @attraction = Attraction.new
  end

  def create
    if !current_user.admin
      redirect_to attractions_path
    end
    attraction = Attraction.new(attraction_params)
    attraction.save
    redirect_to attraction_path(attraction)
  end

  def edit
    if !current_user.admin
      redirect_to attractions_path
    end
  end

  def update
    if !current_user.admin
      redirect_to attractions_path
    end
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating)
  end
end
