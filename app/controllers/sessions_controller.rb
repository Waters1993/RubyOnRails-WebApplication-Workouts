class SessionsController < ApplicationController
  def new
  end

  def create
    @current_user = User.find_by(email: params[:email])
    if @current_user && @current_user.authenticate(params[:password])
      session[:user_id] = @current_user.id
      redirect_to workouts_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    session[:user_id] = @current_user = nil
    redirect_to workouts_path

  end
end
