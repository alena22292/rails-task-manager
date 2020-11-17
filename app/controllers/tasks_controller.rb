class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def show
    id = params[:id]
    @task = Task.find(id)
  end
  def new
    @task = Task.new
  end
  def create
     @task = Task.new(task_params)
     @task.save
     redirect_to task_path(@task)
  end
  def edit
    # get the id from the params
    id = params[:id]
    @task = Task.find(id)
    # find the restaurant with that id
  end

  def update
    # find restaurant by its id
    id = params[:id]
    @task = Task.find(id)
    # update it with data from params
    # redirect to show page.
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
