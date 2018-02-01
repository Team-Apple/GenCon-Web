# frozen_string_literal: true

# RailsSettings Model
class Setting < RailsSettings::Base
  source Rails.root.join('config/app.yml')
  namespace Rails.env

  def self.languaged_trash_kinds
    {
      -1 => 'なし',
      0 => '一般ゴミ',
      1 => '資源ゴミ',
      2 => '容器包装プラゴミ'
    }
  end

  def self.jp_translated_settings
    {
      'trash_rotation' => 'ゴミ出し',
      'exchange_before' => '為替(前)',
      'exchange_after' => '為替(後)'
    }
  end

  def self.jp_translated_boolean
    {
      true => 'オン',
      false => 'オフ'
    }
  end

  def self.jp_translated_days
    {
      0 => '日曜日',
      1 => '月曜日',
      2 => '火曜日',
      3 => '水曜日',
      4 => '木曜日',
      5 => '金曜日',
      6 => '土曜日'
    }
  end
end
