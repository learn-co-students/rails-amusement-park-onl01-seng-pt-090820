class UsersController < ApplicationController
  before_action :set_user, only: :show
  
  def new
    @user = User.new
  end

  def create
    # binding.pry
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    end
  end

  def show
    if current_user != @user
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
