class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        if @user.save
          flash[:success] = "user successfully created"
          redirect_to new_session_path
        else
          #flash[:error] = "Something went wrong"
          render :new, status: :unprocessable_entity
        end
    end
    

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :email)
    end
    
end
