class Event < ApplicationRecord
  validates :title, presence: true
  validates :start_at_date, presence: true
  validates :start_at_time, presence: true
  validates :end_at_date, presence: true
  validates :end_at_time, presence: true
  validates :priority, presence: true
  validate :event_cannot_be_in_the_past

  enum priority: { low: 0, normal: 1, high: 2 }

  def self.get_two_days_events(start)
    two_days = Event.where(start_at_date: start..start.tomorrow)

    current_events = two_days.where(start_at_date: start)
    next_events = two_days.where(start_at_date: start.tomorrow)

    return {"current" => current_events, "next" => next_events}
  end

  def event_cannot_be_in_the_past
    if created_at.nil? or created_at > DateTime.current
      if start_at_date < Date.current
        errors.add(:start_at_date, 'cannot be in the past')
      end
    end
  end

  def priority_color
    case priority_before_type_cast
    when 0
      return 'green'
    when 1
      return 'yellow'
    when 2
      return 'red'
    end
  end
end
