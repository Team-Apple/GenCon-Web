class Api::TasksController < ApplicationController
  before_action :set_task, only: [:update]
  protect_from_forgery :except => [:create, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    if params['start_from_date']
      @tasks = Task.where(start_from_date: params['start_from_date'])
    else
      @tasks = Task.all
    end

    respond_to do |format|
      format.html { render html: '200'}
      format.json { render 'tasks/index', tasks: @tasks, status: :ok }
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { render html: '200' }
        format.json { render 'tasks/task', status: :created, task: @task }
      else
        format.html { render html: '500', status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { render html: '200', status: :ok }
        format.json { render 'tasks/task', status: :ok, task: @task }
      else
        format.html { render html: '500', status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { render html: '200', status: :ok }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.permit(:title, :start_from_date, :start_from_time, :deadline_date, :deadline_time, :memo, :priority)
    end
end
