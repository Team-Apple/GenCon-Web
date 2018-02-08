# frozen_string_literal: true

# RailsSettings Model
class Setting < RailsSettings::Base
  source Rails.root.join('config/app.yml')
  namespace Rails.env

  def self.currencies
    {
      'USD' => 'USD',
      'EUR' => 'EUR',
      'AUD' => 'AUD',
      'GBP' => 'GBP',
      'CAD' => 'CAD',
      'CHF' => 'CHF',
      'CNH' => 'CNH'
    }
  end

  def self.base_currencies
    {
      'JPY_T' => 'JPY_T',
      'BTC_T' => 'BTC_T'
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

  def self.languaged_days
    {
      0 => '日',
      1 => '月',
      2 => '火',
      3 => '水',
      4 => '木',
      5 => '金',
      6 => '土'
    }
  end
end
