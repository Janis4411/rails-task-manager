class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to task_path(task)
   end

  # def destroy
  #   #restaurant = Restaurant.find(params[:id])
  #   restaurant.delete
  #   redirect_to restaurants_path

  # end

  private

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:id])
  # end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
