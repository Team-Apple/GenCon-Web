class DashboardController < ApplicationController
  def home
    two_days_announcement = Announcement.get_two_days_announcements(Date.current)
    @todays_announcements = two_days_announcement["current"]
    @tomorrows_announcements = two_days_announcement["next"]

    two_days_events = Event.get_two_days_events(DateTime.current)
    @todays_events = two_days_events["current"]
    @tomorrows_events = two_days_events["next"]

    two_days_tasks = Task.get_two_days_tasks(DateTime.current)
    @todays_start_tasks = two_days_tasks["current_start"]
    @todays_deadline_tasks = two_days_tasks["current_deadline"]
    @tomorrows_start_tasks = two_days_tasks["next_start"]
    @tomorrows_deadline_tasks = two_days_tasks["next_deadline"]
  end
end
