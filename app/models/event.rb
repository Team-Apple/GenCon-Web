class Event < ApplicationRecord
  enum priority: { low: 0, normal: 1, high: 2 }

  def self.get_two_days_events(start)
    two_days = Event.where(start_at_date: start..start.tomorrow)

    current_events = two_days.where(start_at_date: start)
    next_events = two_days.where(start_at_date: start.tomorrow)

    return {"current" => current_events, "next" => next_events}
  end
end
