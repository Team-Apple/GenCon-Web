# frozen_string_literal: true

class SettingsController < ApplicationController
  before_action :set_setting, only: %i[edit update]

  def index
    @settings = Setting.get_all
  end

  def edit; end

  def update
    result =
      if params[:id] == 'trash_rotation'
        new_rotation = {}
        (0..6).to_a.each do |day|
          new_rotation.store(day, params[:trash_rotation][day])
        end
        p new_rotation
        new_rotation
      else
        params[:setting][:value]
      end
    if @setting.value != result
      @setting.value = result
      @setting.save
    end
    redirect_to settings_path
  end

  private

  def set_setting
    @setting = Setting.find_by(var: params[:id]) || Setting.new(var: params[:id])
  end
end
