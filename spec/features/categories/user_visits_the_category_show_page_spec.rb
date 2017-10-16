require 'rails_helper'

describe 'When a user visits a category show page' do
  it 'they see the categories title' do
    category = Category.create(title: "Smells Weird")

    visit category_path(category)

    expect(page).to have_content("Smells Weird")
  end
end