class AttemptsController < ApplicationController
    def create
        @workout = Workout.find(params[:workout_id])
        @attempt = @workout.attempts.create(attempt_params)
        @attempt.save
        redirect_to workout_path(@workout)
    end
    
    def destroy
        @workout = Workout.find(params[:workout_id])
        @comment = @workout.attempts.find(params[:id])
        @comment.destroy
        redirect_to workout_path(@workout), status: :see_other
    end


    private
    def attempt_params
        params.require(:attempt).permit(:name, :minutes, :seconds, :user_id)
    end

end
