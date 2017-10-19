require 'rails_helper'

describe "Validations" do
  before :each do
    @company = Company.create(name: "Joels Banana Farm")
  end

  it "is invalid without attributes" do
    contact = Contact.create()

    expect(contact).to_not be_valid
  end

  it "is invalid without a company id" do
    contact = Contact.create(full_name: "Ashkandi, Greatsword of the Brotherhood", position: "Banana Picker", email: "whatever@whatever.com")

    expect(contact).to be_invalid
  end

  it "is invalid without a full name" do
    contact = Contact.create(position: "Banana Picker", email: "email@email.com", company: @company)

    expect(contact).to_not be_valid
  end

  it "is invalid without a position" do
    contact = Contact.create(full_name: "Ashkandi, Greatsword of the Brotherhood", email: "email@email.com", company: @company)

    expect(contact).to_not be_valid
  end

  it "is invalid without an email" do
    contact = Contact.create(full_name: "Ashkandi, Greatsword of the Brotherhood", position: "Banana Picker", company: @company)

    expect(contact).to_not be_valid
  end

  it "is valid with all attributes" do
    contact = Contact.create(full_name: "Ashkandi, Greatsword of the Brotherhood", position: "Banana Picker", email: "whatever@whatever.com", company: @company)

    expect(contact).to be_valid
  end
end