class Api::AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:update]
  protect_from_forgery :except => [:create, :update, :destroy]

  # GET /announcements
  # GET /announcements.json
  def index
    @announcements = Announcement.all

    respond_to do |format|
      format.html { render html: '200' }
      format.json { render 'announcements/index', announcements: @announcements, status: :ok }
    end
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @announcement = Announcement.new(announcement_params)

    respond_to do |format|
      if @announcement.save
        format.html { render html: '200' }
        format.json { render 'announcements/announcement', status: :created, announcement: @announcement }
      else
        format.html { render html: '500', status: :unprocessable_entity }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1
  # PATCH/PUT /announcements/1.json
  def update
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { render html: '200', status: :ok }
        format.json { render 'announcements/announcement', status: :ok, announcement: @announcement }
      else
        format.html { render html: '500', status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    respond_to do |format|
      format.html { render html: '200', status: :ok }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params.permit(:date, :timing, :mode)
    end
end
