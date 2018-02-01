class SettingsController < ApplicationController
  before_action :set_setting, only: %i[edit update]
  around_action :render_form, only: :edit

  def edit; end

  def update
    if @setting.value != params[:setting][:value]
      @setting.value = params[:setting][:value]
      @setting.save
    else
      redirect_to dashboard_home_path
    end
  end

  private

  def set_setting
    @setting = Setting.find_by(var: params[:id]) || Setting.new(var: params[:id])
  end
end
