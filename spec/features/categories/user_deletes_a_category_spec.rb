require 'rails_helper'

describe 'When a user visits the category index page' do
  it 'they can delete a category' do
    Category.create(title: "Smells Weird")

    visit categories_path

    click_on("Delete Category")

    expect(page).to have_content("Smells Weird was successfully deleted!")
  end
end