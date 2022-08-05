class WorkoutsController < ApplicationController

    def random
        @workout = Workout.order('RANDOM()').first
        render 'workouts/show', workout: @workout
    end

    def index
        @workouts = Workout.all
    end

    def show
        @workout = Workout.find(params[:id])
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
    params.require(:workout).permit(:trainer, :name, :description, :warmup, :body, :finish)
    end
end
