class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def view
    @jobs = Job.all
  end

  def create
    Job.create(job_params)
    redirect_to all_jobs_path
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.update(params[:id],job_params)
    redirect_to all_jobs_path
  end

  def destroy
    @job = Job.destroy(params[:id])
    redirect_to all_jobs_path
  end

  def show
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
