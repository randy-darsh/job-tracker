class JobsController < ApplicationController

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new
    @contacts = Contact.all
  end

  def new
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def show
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@company, @job)
    else
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy

    flash[:success] = "#{job.title} was successfully deleted!"
    redirect_to company_jobs_path
  end

  def sort
    if params[:location]
      @jobs = Job.where(city: params[:location])
      @message = "All jobs in #{params[:location]}"
    elsif params[:sort] == "interest"
      @jobs = Job.order(:level_of_interest)
      @message = "Jobs sorted by level of interest"
    else
      @jobs = Job.all
      @message = "All Jobs"
    end
  end

  def dashboard
    @job_count_by_interest = Job.count_by_interest
    @job_count_by_city  = Job.count_by_city
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company_id)
  end
end
