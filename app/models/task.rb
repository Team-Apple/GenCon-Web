class Task < ApplicationRecord
  validates :title, presence: true
  validates :start_from_date, presence: true
  validates :start_from_time, presence: true
  validates :deadline_date, presence: true
  validates :deadline_time, presence: true
  validates :priority, presence: true
  validate :task_cannot_be_in_the_past

  enum priority: { low: 0, normal: 1, high: 2 }

  def self.get_two_days_tasks(start)
    two_days = Task.where(start_from_date: start..start.tomorrow, deadline_date: start..start.tomorrow)

    current_start_tasks = two_days.where(start_from_date: start)
    current_deadline_tasks = two_days.where(deadline_date: start)

    next_start_tasks = two_days.where(start_from_date: start.tomorrow)
    next_deadline_tasks = two_days.where(deadline_date: start.tomorrow)

    {
      'current_start' => current_start_tasks,
      'current_deadline' => current_deadline_tasks,
      'next_start' => next_start_tasks,
      'next_deadline' => next_deadline_tasks
    }
  end

  def task_cannot_be_in_the_past
    return unless created_at.nil? || created_at > DateTime.current
    return unless start_from_date < Date.current
    errors.add(:start_from_date, 'cannot be in the past')
  end

  def priority_color
    case priority_before_type_cast
    when 0
      'green'
    when 1
      'yellow'
    when 2
      'red'
    end
  end
end
