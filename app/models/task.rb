class Task < ApplicationRecord
  validates :title, presence: true
  validates :start_from_date, presence: true
  validates :start_from_time, presence: true
  validates :deadline_date, presence: true
  validates :deadline_time, presence: true
  validates :priority, presence: true
  validate :task_cannot_be_in_the_past

  def self.get_two_days_tasks(start)
    two_days = Task.where(start_from_date: start..start.tomorrow, deadline_date: start..start.tomorrow)

    current_start_tasks = two_days.where(start_from_date: start)
    current_deadline_tasks = two_days.where(deadline_date: start)

    next_start_tasks = two_days.where(start_from_date: start.tomorrow)
    next_deadline_tasks = two_days.where(deadline_date: start.tomorrow)

    return {"current_start" => current_start_tasks, "current_deadline" => current_deadline_tasks, "next_start" => next_start_tasks, "next_deadline" => next_deadline_tasks}
  end

  def task_cannot_be_in_the_past
    if created_at.nil? or created_at > DateTime.current
      if start_from_date < Date.current
        errors.add(:start_from_date, 'cannot be in the past')
      end
    end
  end
end
