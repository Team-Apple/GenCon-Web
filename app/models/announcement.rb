class Announcement < ApplicationRecord
  validates :timing, inclusion: { in: [true, false] }
  validates :mode, presence: true
  validate :announcement_cannot_be_in_the_past

  enum mode: { weather: 0, trash: 1, exchange: 2 }

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
end
