class DashboardController < ApplicationController
  def home
    @todays_announcements = Announcement.where(date: Date.current)
    @tomorrows_announcements = Announcement.where(date: Date.tomorrow)
  end
end
