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

  def update
    task = current_user.tasks.find(params[:id])

    updated_attributes = task_params.to_h
    if task_params[:completed_at]
      completed_at = task.completed_at.nil? ? Time.current : nil
      updated_attributes[:completed_at] = completed_at
    end

    render json: task if task.update(updated_attributes)
  rescue ::ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  def destroy
    if params[:id] == 'all' && current_user.tasks.completed.destroy_all
      return render json: {}, status: :ok
    end

    task = current_user.tasks.find(params[:id])
    if task && task.destroy
      render json: task
    else
      render json: { error: task.errors.full_messages }, status: :not_found
    end
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
