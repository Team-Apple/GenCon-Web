class Task < ApplicationRecord
  def self.get_two_days_tasks(start)
    two_days = Task.where(start_from: start.beginning_of_day..start.tomorrow.end_of_day, deadline: start.beginning_of_day..start.tomorrow.end_of_day)

    current_start_tasks = two_days.where(start_from: start.beginning_of_day..start.end_of_day)
    current_deadline_tasks = two_days.where(deadline: start.beginning_of_day..start.end_of_day)

    next_start_tasks = two_days.where(start_from: start.tomorrow.beginning_of_day..start.tomorrow.end_of_day)
    next_deadline_tasks = two_days.where(deadline: start.tomorrow.beginning_of_day..start.tomorrow.end_of_day)

    return {"current_start" => current_start_tasks, "current_deadline" => current_deadline_tasks, "next_start" => next_start_tasks, "next_deadline" => next_deadline_tasks}
  end
end
