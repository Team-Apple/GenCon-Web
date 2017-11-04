class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  around_action :render_form, only: [:new, :edit]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @task = Task.new

    respond_to do |format|
      format.html
      format.json { render 'tasks/index', tasks, @tasks }
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to dashboard_home_path }
        format.json { render 'task', status: :created, task: @task }
      else
        format.html { render dashboard_home_path }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to dashboard_home_path }
      else
        format.html { render html: '500' }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_home_path, notice: 'Task was successfully destroyed.' }
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
      params.require(:task).permit(:title, :start_from_date, :start_from_time, :deadline_date, :deadline_time, :memo, :priority)
    end
end
