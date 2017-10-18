require 'rails_helper'

describe "User visits a company show page" do
  before :each do
    @company = Company.create(name: "Place")
    visit company_path(@company)
  end

  it "they see a form for adding contact information" do
    expect(page).to have_content("Full Name")
    expect(page).to have_content("Position")
    expect(page).to have_content("Email")
    expect(page).to have_content("Company")
  end

  it "they can create a new contact" do
    fill_in "contact[full_name]", with: "Some Lady"
    fill_in "contact[position]", with: "Some Position"
    fill_in "contact[email]", with: "email@email.com"
    fill_in "contact[company]", with: "Some Company"

    click_on "Create Contact"
  end
end