class Announcement < ApplicationRecord
  def self.get_two_days_announcements(start)
    two_days = Announcement.where(date: start..start.tomorrow)

    current_announcements = two_days.where(date: start)
    next_announcements = two_days.where(date: start.tomorrow)

    return {"current" => current_announcements, "next" => next_announcements}
  end
end
