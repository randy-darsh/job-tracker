require 'rails_helper'

describe "When a user visits the category new page" do
  it "they can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "Smells Weird"

    click_on "Create Category"

    expect(current_path).to eq(category_path(Category.last))

    expect(page).to have_content("Smells Weird")
  end
end