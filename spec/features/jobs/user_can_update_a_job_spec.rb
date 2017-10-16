require 'rails_helper'

describe "User visits the edit job page" do
  before :each do
    @company = Company.create(name: 'Joels Banana Farm')
    @job = Job.create(title: 'Banana Picker', description: "You pick bananas", city: 'Banana Town', level_of_interest: '10', company: @company)
  end
  it 'they can edit a job' do
    visit edit_company_job_path(@company, @job)

    fill_in "job[title]", with: "Banana Inspector"
    fill_in "job[description]", with: "You inspect bananas"
    fill_in "job[city]", with: "Banana Land"
    fill_in "job[level_of_interest]", with: 11

    click_on "Update Job"

    visit company_job_path(@company, @job)

    expect(page).to have_content("Title: Banana Inspector")
    expect(page).to have_content("Description: You inspect bananas")
    expect(page).to have_content("Level of Interest: 11")
    expect(page).to have_content("City: Banana Land")
  end
end