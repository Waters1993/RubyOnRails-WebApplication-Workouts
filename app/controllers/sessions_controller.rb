class SessionsController < ApplicationController
  def new
  end

  def create
    @current_user = User.find_by(email: params[:email])
    if @current_user && @current_user.authenticate(params[:password])
      session[:user_id] = @current_user.id
      redirect_to workouts_path
    else
      flash[:warning] = "You need to register an account before logging in"
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    session[:user_id] = @current_user = nil
    flash[:success] = "Successfully logged out"
    redirect_to workouts_path

  end
end
