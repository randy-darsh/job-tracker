require 'rails_helper'

describe "When a user visits a job show page" do
  before :each do
    @category = Category.create(title: "Lame")
    @company = Company.create(name: 'Joels Banana Farm')
    @job = Job.create(title: 'Banana Picker', description: "You pick bananas", city: 'Banana Town', level_of_interest: '10', company: @company, category: @category)
  end

  it 'there is a form for comments' do
    visit company_job_path(@company, @job)

    expect(page).to have_content("Comments")
    fill_in "comment[content]", with: "The guy that owns this place is a total jerk."

    click_on("Create Comment")
  end

  it 'they can create a comment' do
    visit company_job_path(@company, @job)

    fill_in "comment[content]", with: "The guy that owns this place is a total jerk."
    click_on("Create Comment")

    expect(page).to have_content("The guy that owns this place is a total jerk.")
  end
end