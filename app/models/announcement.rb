class Announcement < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true
  validates :timing, presence: true
  validates :mode, presence: true
  validate :announcement_cannot_be_in_the_past

  enum mode: { event: 0, task: 1, weather: 2, trash: 3, exchange: 4}

  def self.get_two_days_announcements(start)
    two_days = Announcement.where(date: start..start.tomorrow)

    current_announcements = two_days.where(date: start)
    next_announcements = two_days.where(date: start.tomorrow)

    return {"current" => current_announcements, "next" => next_announcements}
  end

  def announcement_cannot_be_in_the_past
    if created_at.nil? or created_at > DateTime.current
      if date < Date.current
        errors.add(:date, 'cannot be in the past')
      end
    end
  end
end
