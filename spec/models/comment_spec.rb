require 'rails_helper'

describe "Validations" do
  it "is invalid without content" do
    comment = Comment.create()

    expect(comment).to_not be_valid
  end

  it "is valid with content" do
    category = Category.new(title: "Lame")
    company = Company.new(name: "Turing")
    job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
    comment = Comment.new(content: "ESPN is super great or whatever.", job: job)

    expect(comment).to be_valid
  end
end
