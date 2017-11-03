class Api::EventsController < ApplicationController
  before_action :set_event => [:update]
  protect_from_forgery :except => [:create, :update, :destroy]

  # GET /api/events.json
  # GET /api/events.json?start_at_date=
  def index
    if params['start_at_date']
      @events = Event.where(start_at_date: params['start_at_date'])
    else
      @events = Event.all
    end

    respond_to do |format|
      format.html { render html: '200' }
      format.json { render 'events/index', events: @events, status: :ok }
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { render html: '200' }
        format.json { render 'events/event', event: @event, status: :created }
      else
        format.html { render html: '500', status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to dashboard_home_path, notice: 'Event was successfully updated.' }
        format.json { render 'event', status: :ok, event: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id]) # cannot find at before_action
    @event.destroy
    respond_to do |format|
      format.html { render html: '200', status: :ok }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      puts @event.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.permit(:title, :start_at_date, :start_at_time, :end_at_date, :end_at_time, :memo, :priority)
    end
end
