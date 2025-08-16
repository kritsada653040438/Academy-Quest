require 'rails_helper'

describe "Quests", type: :request do
  describe "GET /index" do
    it "returns a success response" do
      get quests_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /create" do
    context "with valid params" do
      let(:valid_params) { { quest: { title: "New Quest", description: "Find the sword" } } }

      it "creates a new quest" do
        expect {
          post quests_path, params: valid_params
        }.to change(Quest, :count).by(1)
      end

      it "redirects to index" do
        post quests_path, params: valid_params
        expect(response).to redirect_to(quests_path)
      end
    end

    context "with invalid params" do
      let(:invalid_params) { { quest: { title: "" } } }

      it "does not create a new quest" do
        expect {
          post quests_path, params: invalid_params
        }.not_to change(Quest, :count)
      end

      it "renders index again" do
        post quests_path, params: invalid_params
        expect(response.body).to include("form") # เช็คว่ากลับมาหน้า index
      end
    end
  end

  describe "PATCH /update" do
    let!(:quest) { Quest.create!(title: "Update Quest", status: false) }

    it "updates the status" do
      patch quest_path(quest), params: { status: "1" }
      quest.reload
      expect(quest.status).to eq(true)
    end

    it "redirects back to quests" do
      patch quest_path(quest), params: { status: "1" }
      expect(response).to redirect_to(quests_path)
    end
  end

  describe "DELETE /destroy" do
    let!(:quest) { Quest.create!(title: "Destroy Quest", status: false) }

    it "destroys the quest" do
      expect {
        delete quest_path(quest)
      }.to change(Quest, :count).by(-1)
    end

    it "redirects back to quests" do
      delete quest_path(quest)
      expect(response).to redirect_to(quests_path)
    end
  end
end
