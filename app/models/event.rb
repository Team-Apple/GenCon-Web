class Event < ApplicationRecord
  def self.get_two_days_events(start)
    two_days = Event.where(start_at: start.beginning_of_day..start.tomorrow.end_of_day)

    current_events = two_days.where(start_at: start.beginning_of_day..start.end_of_day)
    next_events = two_days.where(start_at: start.tomorrow.beginning_of_day..start.tomorrow.end_of_day)

    return {"current" => current_events, "next" => next_events}
  end
end
