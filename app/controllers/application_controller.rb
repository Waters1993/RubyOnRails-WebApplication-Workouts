class ApplicationController < ActionController::Base
    # Adding a filter method
    before_action :current_user

    protected

    def current_user
        return unless session[:user_id]
        @current_user = User.where(id: session[:user_id]).first    
    end

    def require_user_logged_in!
        redirect_to new_session_path, alert: 'You must be signed in' if @current_user.nil?
    end


end
