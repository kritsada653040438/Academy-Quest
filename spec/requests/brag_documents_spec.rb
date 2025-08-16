require "rails_helper"

RSpec.describe "BragDocuments", type: :request do
  describe "GET /show" do
    let!(:completed_quest) { Quest.create!(title: "Quest A", description: "Done", status: true, updated_at: 1.day.ago) }
    let!(:completed_quest2) { Quest.create!(title: "Quest B", description: "Done later", status: true, updated_at: Time.current) }
    let!(:uncompleted_quest) { Quest.create!(title: "Quest C", description: "Not done", status: false) }

    it "returns http success" do
      get brag_document_path
      expect(response).to have_http_status(:success)
    end

    it "renders completed quests" do
      get brag_document_path
      expect(response.body).to include("Quest A")
      expect(response.body).to include("Quest B")
    end

    it "does not render uncompleted quests" do
      get brag_document_path
      expect(response.body).not_to include("Quest C")
    end
  end
end
