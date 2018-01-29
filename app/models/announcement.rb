class Announcement < ApplicationRecord
  validates :date, presence: true
  validates :timing, inclusion: { in: [true, false] }
  validates :mode, presence: true
  validate :announcement_cannot_be_in_the_past

  enum mode: { weather: 0, trash: 1, exchange: 2 }

  def self.get_two_days_announcements(start)
    two_days = Announcement.where(date: start..start.tomorrow)

    current_announcements = two_days.where(date: start)
    next_announcements = two_days.where(date: start.tomorrow)

    { 'current' => current_announcements, 'next' => next_announcements }
  end

  def self.jp_translated_modes
    { 'weather' => '天気', 'trash' => 'ゴミ出し', 'exchange' => '為替' }
  end

  def self.jp_translated_timing
    { true => '家を出るとき', false => '家に帰ったとき' }
  end

  def self.mode_icons_and_colors
    {
      'weather' => %w[wb_sunny orange],
      'trash' => %w[whatshot red],
      'exchange' => %w[timeline yellow]
    }
  end

  def announcement_cannot_be_in_the_past
    return unless created_at.nil? || created_at > DateTime.current
    return unless date < Date.current
    errors.add(:date, 'cannot be in the past')
  end
end
