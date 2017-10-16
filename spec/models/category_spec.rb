require 'rails_helper'

describe Category do
  describe "Validations" do
    it "is invalid without a title" do
      category = Category.create()

      expect(category).to be_invalid
    end

    it "has a unique title" do
      Category.create(title: "Lame")
      category = Category.new(title: "Lame")

      expect(category).to be_invalid
    end

    it "is valid with a title" do
      category = Category.new(title: "Not Lame")

      expect(category).to be_valid
    end
  end
end