class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = filtered_tasks
    @active_count = Task.active.size
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
end
