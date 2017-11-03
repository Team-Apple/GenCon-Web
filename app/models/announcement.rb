class Announcement < ApplicationRecord
  enum mode: { event: 0, task: 1, weather: 2, trash: 3, exchange: 4}
  
  def self.get_two_days_announcements(start)
    two_days = Announcement.where(date: start..start.tomorrow)

    current_announcements = two_days.where(date: start)
    next_announcements = two_days.where(date: start.tomorrow)

    return {"current" => current_announcements, "next" => next_announcements}
  end
end
