class WorkoutsController < ApplicationController
before_action :require_user_logged_in!

    def random
        @workout = Workout.order('RANDOM()').first
        render 'workouts/show', workout: @workout
    end

    def index
        @workouts = Workout.where("user_id = ?", session[:user_id])
    end

    def show
        if @current_user.workouts.find_by_id(params[:id])
            @workout = @current_user.workouts.find_by_id(params[:id])
        else
            flash[:error] = "You don't have access to that item or it doesn't exist"
            redirect_to workouts_path
        end
    end

    def new
        @workout = Workout.new
    end

    def create
        @workout = Workout.create(workout_params)

        if @workout.save
            redirect_to workout_path(@workout)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @workout = Workout.find(params[:id])
    end

    def update
        @workout = Workout.find(params[:id])

        if @workout.update(workout_params)
            redirect_to workout_path(@workout)
        else
            render edit:
        end
    end

    private
    def workout_params
    params.require(:workout).permit(:trainer, :name, :description, :warmup, :body, :finish, :user_id)
    end



    

end
