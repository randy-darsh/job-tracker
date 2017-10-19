class ContactsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      flash[:success] = "You added a new contact for #{@company.name}!"
      redirect_to company_jobs_path(@company)
    else
      redirect_to company_jobs_path(@company)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email, :company_id)
  end
end