# frozen_string_literal: true

module Api
  class SettingsController < ApplicationController
    # GET /api/settings/trash
    def todays_trash
      day_int = Date.current.wday
      render plain: Setting.trash_rotation[day_int]
    end

    def exchange
      render plain:
        "#{Setting.exchange_before}/#{Setting.exchange_after}"
    end
  end
end
