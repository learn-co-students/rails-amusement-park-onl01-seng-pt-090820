class SessionsController < ApplicationController
  def signin
    @user = User.new
  end

  def create
    user = User.find_by(id: params[:user][:name])
    if logged_in?
      redirect_to root_path
    end
    if user && user.authenticate(params[:user][:password])
      # binding.pry
      session[:user_id] = user.id
      redirect_to user_path(user)
      
    else
      redirect_to signin_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end
end
