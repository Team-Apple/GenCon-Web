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

    { 'current' => current_events, 'next' => next_events }
  end

  def event_cannot_be_in_the_past
    return unless created_at.nil? || created_at > DateTime.current
    return unless start_at_date < Date.current
    errors.add(:start_at_date, 'cannot be in the past')
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
