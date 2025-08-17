# spec/features/brag_documents_spec.rb
require 'rails_helper'

RSpec.feature "BragDocuments", type: :feature do
  scenario "user visits brag document page" do
    visit brag_document_path
    expect(page).to have_content("My Brag Document")
  end

  scenario "user can go back to Quest page" do
    visit brag_document_path
    click_link "Back to Quest Hub"
    expect(page).to have_content("Kritsada Mahanam")
    expect(page).to have_content("My Academy Quests")
  end

  scenario "user visits brag document page and sees completed quests" do
    # สร้าง test data
    completed_quest = Quest.create!(title: "Finished Quest", status: true, updated_at: 2.days.ago)

    # ไปที่หน้า brag document
    visit brag_document_path

    # เช็คว่าเนื้อหามีครบ
    expect(page).to have_content("Finished Quest")
  end
end
