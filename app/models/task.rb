class Task < ApplicationRecord


  def self.get_two_days_tasks(start)
    two_days = Task.where(start_from_date: start..start.tomorrow, deadline_date: start..start.tomorrow)

    current_start_tasks = two_days.where(start_from_date: start)
    current_deadline_tasks = two_days.where(deadline_date: start)

    next_start_tasks = two_days.where(start_from_date: start.tomorrow)
    next_deadline_tasks = two_days.where(deadline_date: start.tomorrow)

    return {"current_start" => current_start_tasks, "current_deadline" => current_deadline_tasks, "next_start" => next_start_tasks, "next_deadline" => next_deadline_tasks}
  end
end
