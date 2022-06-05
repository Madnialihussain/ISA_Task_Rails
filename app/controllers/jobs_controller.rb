class JobsController < ApplicationController
  before_action :authorize_request
  before_action :set_job, only: %i[ show update destroy ]
  

  # GET /jobs
  def index
    @jobs = GoodJob::ActiveJobJob.all.sort_by { |a| a.created_at } 
    render json: @jobs, only: [:id, :queue_name, status, :finished_at, :active_job_id, :priority, :created_at], methods: [:status]

  end

  # GET /jobs/1
  def show
    render json: @job
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)
    @job.time = Time.now
    if @job.save
        job_status = IsaJob.set(queue: :default, wait: @job.wait_time, priority: 1).perform_later(@job.movies_array, @job.id) if @job.priority == "default"
        job_status = IsaJob.set(queue: :low, wait: @job.wait_time, priority: 0).perform_later(@job.movies_array, @job.id) if @job.priority == "low"
        job_status = IsaJob.set(queue: :high, wait: @job.wait_time, priority: 2).perform_later(@job.movies_array, @job.id) if @job.priority == "high"
      render json: @job, only: [:time], status: :created, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end
    
 
    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:wait_time, :status, :priority, :movies_array => [])
    end
end
