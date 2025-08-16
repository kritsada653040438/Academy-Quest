require 'rails_helper'

describe Quest, type: :model do
  describe "validations" do
    it "is valid with a title and default status" do
      quest = Quest.new(title: "Find the treasure", description: "Go to the cave")
      expect(quest).to be_valid
    end

    it "is invalid without a title" do
      quest = Quest.new(title: nil, description: "Missing title")
      expect(quest).not_to be_valid
      expect(quest.errors[:title]).to include("can't be blank")
    end

    it "is valid without a description" do
      quest = Quest.new(title: "Valid Title", description: nil)
      expect(quest).to be_valid
    end

    it "defaults status to false" do
      quest = Quest.create!(title: "Rescue the princess")
      expect(quest.status).to eq(false)
    end

    it "is invalid with status set to nil" do
      quest = Quest.new(title: "Test quest", status: nil)
      expect(quest).not_to be_valid
      expect(quest.errors[:status]).to include("is not included in the list")
    end
  end
end
