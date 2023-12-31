class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category
    before_action :set_task, only: [:show, :edit, :update, :destroy]
  
    def index
      @tasks = @category.tasks
    end
  
    def show
  
    end
  
    def new
      @task = @category.tasks.build
    end
  
    def create
      @task = @category.tasks.build(task_params)
  
      if @task.save
        redirect_to category_task_path(@category, @task), notice: 'Successfully created new task.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      
    end
  
    def update
      if @task.update(task_params)
        redirect_to category_task_path(@category, @task), notice: 'Successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @task.destroy
      redirect_to category_path(@category), notice: 'Successfully deleted the task.'
    end

    private
    
    def set_category
      @category = current_user.categories.find(params[:category_id])
    end
  
    def set_task
      @task = @category.tasks.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:title, :description, :due_date, :done)
    end

end
