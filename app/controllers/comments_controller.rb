class CommentsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)
    if @comment.save
      flash[:success] = "You added a new comment for #{@job.title}!"
      redirect_to company_job_path(@company, @job)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end
end