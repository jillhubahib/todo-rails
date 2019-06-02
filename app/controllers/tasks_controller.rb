class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = filtered_tasks
    @active_count = Task.active.size
  end

  def create
    task = current_user.tasks.build(task_params)

    if task.save
      flash[:notice] = "Task '#{task.name}' successfully created"
    else
      flash[:alert] = task.error.full_messages
    end

    redirect_to root_path
  end

  private

  def filter
    @filter ||= params[:filter]&.downcase
  end

  def filtered_tasks
    if filter && Task::VALID_FILTER.include?(filter)
      Task.send(params[:filter])
    else
      Task.all
    end
  end

  def task_params
    params.require(:task).permit(:name, :completed_at)
  end
end
