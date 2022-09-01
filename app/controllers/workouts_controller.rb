class WorkoutsController < ApplicationController
    before_action :require_user_logged_in!

    # List workouts created by current user
    def index
        @workouts = Workout.belonging_to_user(session[:user_id])
    end

    # Display a list of workouts with status set to public
    def public
        @workouts = Workout.find_public
    end

    # Chose a random workout from the list of public workouts
    def random
        @workout = Workout.random
        render 'workouts/show', workout: @workout
    end

    
    # Check if the workout is public or owned by the user before show action
    def show
        if Workout.find(params[:id]).private?
            unless @current_user.workouts.find_by_id(params[:id])
                flash[:error] = "You don't have access to that item or it doesn't exist"
                redirect_to workouts_path
            else 
                @workout = Workout.find_by_id(params[:id])
            end
        else
            @workout = Workout.find_by_id(params[:id])
        end
    end    

    # Create a new record
    def new
        @workout = Workout.new
    end

    def create
        @workout = Workout.create(workout_params)

        if @workout.save
            flash[:notice] = "New workout successfully created"
            redirect_to workout_path(@workout)
        else
            render :new, status: :unprocessable_entity
        end
    end

    # Edit an existing record
    def edit
        if @current_user.workouts.find_by_id(params[:id])
            @workout = @current_user.workouts.find_by_id(params[:id])
        else 
            flash[:error] = "You don't own this workout"
            redirect_to workout_path(Workout.find(params[:id]))
        end
    end

    def update
        @workout = Workout.find(params[:id])

        if @workout.update(workout_params)
            flash[:notice] = "Edit Successful"
            redirect_to workout_path(@workout)
        else
            render edit:
        end
    end

    # Destroy a record
    def destroy
        if @current_user.workouts.find_by_id(params[:id])
            @workout = @current_user.workouts.find_by_id(params[:id])
            @workout.destroy
            flash[:notice] = "Workout #{params[:id]} successfully destroyed"
            redirect_to workouts_path, status: :see_other
        else
            flash[:error] = "You don't own this workout"
            redirect_to workouts_path
        end
    end

    private
    def workout_params
    params.require(:workout).permit(:trainer, :name, :description, :warmup, :body, :finish, :user_id, :status)
    end    

end
