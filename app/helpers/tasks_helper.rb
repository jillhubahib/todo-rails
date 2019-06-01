module TasksHelper
  def show_active(filter, current_filter)
    default_empty_filter = filter == 'all' && current_filter.to_s == ''
    (filter == current_filter || default_empty_filter) ? 'active' : ''
  end

  def show_complete_by(is_completed, filter)
    is_completed && (filter.nil? || filter && filter == 'all') ? 'completed' : ''
  end
end
