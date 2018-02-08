# frozen_string_literal: true

class SettingsController < ApplicationController
  before_action :set_setting, only: %i[edit update]

  def index
    @settings = Setting.get_all
  end

  def edit; end

  def update
    return if params[:value].nil?
    result = params[:value]
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
