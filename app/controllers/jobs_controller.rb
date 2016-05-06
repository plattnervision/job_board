class JobsController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    @jobs = Job.order(sort_column + " " + sort_direction)
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

  def sort_column
    Job.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
