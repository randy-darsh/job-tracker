require 'rails_helper'

describe "User visits a company jobs index page" do
  before :each do
    @category = Category.create(title: "Lame")
    @company = Company.create(name: 'Joels Banana Farm')
    @job = Job.create(title: 'Banana Picker', description: "You pick bananas", city: 'Banana Town', level_of_interest: '10', company: @company, category: @category)
  end

  it 'they can delete a job' do
    visit company_jobs_path(@company, @job)

    click_on("Delete Job")

    expect(page).to have_content("Banana Picker was successfully deleted!")
  end
end
