class Announcement < ApplicationRecord
  validates :date, presence: true
  validates :timing, inclusion: { in: [true, false] }
  validates :mode, presence: true
  validate :announcement_cannot_be_in_the_past

  enum mode: { event: 0, task: 1, weather: 2, trash: 3, exchange: 4}

  def self.get_two_days_announcements(start)
    two_days = Announcement.where(date: start..start.tomorrow)

    current_announcements = two_days.where(date: start)
    next_announcements = two_days.where(date: start.tomorrow)

    return {"current" => current_announcements, "next" => next_announcements}
  end

  def self.jp_translated_modes
    return {"event" => "イベント", "task"=> "タスク", "weather"=> "天気", "trash"=> "ゴミ出し", "exchange"=> "為替"}
  end

  def self.jp_translated_timing
    return {true => "家を出るとき", false => "家に帰ったとき"}
  end

  def self.mode_icons_and_colors
    return {"event" => ['event', 'green'], "task" => ['assignment', 'purple'], "weather" => ['wb_sunny', 'orange'], "trash" => ['whatshot', 'red'], "exchange" => ['timeline', 'yellow']}
  end

  def announcement_cannot_be_in_the_past
    if created_at.nil? or created_at > DateTime.current
      if date < Date.current
        puts "****************past***************"
        errors.add(:date, 'cannot be in the past')
      end
    end
  end
end
