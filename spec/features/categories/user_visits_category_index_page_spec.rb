require 'rails_helper'

describe 'User visits the category index page' do
  before :each do
    Category.create(title: "Lame")
    Category.create(title: "Not Lame")
  end

  it "they see a list of all the categories" do
    visit categories_path

    expect(page).to have_content("Lame")
    expect(page).to have_content("Not Lame")
  end

  it 'they see edit and delete links' do
    visit categories_path

    expect(page).to have_content("Edit Category")
    expect(page).to have_content("Delete Category")
  end


end