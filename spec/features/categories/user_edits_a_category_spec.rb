require 'rails_helper'

describe 'User visits a category edit page' do
  before :each do
    @category = Category.create(title: 'Lame')
  end
  it 'they can edit a category' do
    visit edit_category_path(@category)

    expect(page).to have_content("Title")

    fill_in "category[title]", with: "Not Lame"

    click_on ("Update Category")

    expect(current_path).to eq(category_path(@category))

    expect(page).to have_content("Not Lame")
  end
end