# frozen_string_literal: true

module Api
  class SettingsController < ApplicationController
    # GET /api/settings/trash
    def todays_trash
      day_int = Date.current.wday 
      trash_kind = Setting.trash_rotation[day_int].to_i
      render plain: Setting.languaged_trash_kinds[trash_kind]
    end
  end
end
