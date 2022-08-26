class WorkoutsController < ApplicationController
    before_action :require_user_logged_in!

    def public
        @workouts = Workout.all
        # render 'workouts/random', workout: @workout
    end

    def random
        @workout = Workout.order(Arel.sql('RANDOM()')).first
        render 'workouts/show', workout: @workout
    end

    def index
        @workouts = Workout.where("user_id = ?", session[:user_id])
    end

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

    
    # def show
    #     if @current_user.workouts.find_by_id(params[:id])
    #         @workout = @current_user.workouts.find_by_id(params[:id])
    #     elsif unless Workout.find(params[:id]).private?
    #         @workout = Workout.find(params[:id])
    #     else
    #         flash[:error] = "You don't have access to that item or it doesn't exist"
    #         redirect_to workouts_path
    #     end
    # end

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

    def edit
        if @current_user.workouts.find_by_id(params[:id])
            @workout = @current_user.workouts.find_by_id(params[:id])
        else 
            flash[:error] = "You don't own this workout"
            redirect_to workout_path(Workout.find(params[:id]))
        end
    end
    # def edit
    #     @workout = Workout.find(params[:id])
    # end

    def update
        @workout = Workout.find(params[:id])

        if @workout.update(workout_params)
            flash[:notice] = "Edit Successful"
            redirect_to workout_path(@workout)
        else
            render edit:
        end
    end

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
