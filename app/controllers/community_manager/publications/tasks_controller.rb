class CommunityManager::Publications::TasksController < ApplicationController
  before_action :authenticate_user!, :should_be_communty_manager!

  def show
    @task = Task.find(params[:id])
    render json: { task: @task, status: 200 } unless @task.nil?
  end

  def create
    @task = Publication.find(params[:publication_id]).tasks.new(task_params)
    @task.creator = current_user
    @task.user = User.find(params[:community_manager_id])
    if @task.save
      render json: { task: @task, status: 200 }
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :content)
  end
end
