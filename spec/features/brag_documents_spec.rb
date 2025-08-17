# spec/features/brag_documents_spec.rb
require 'rails_helper'

RSpec.feature "BragDocuments", type: :feature do
  scenario "user visits brag document page and sees quests", js: true do
    # สร้าง test data
    completed_quest = Quest.create!(title: "Finished Quest", status: true, updated_at: 2.days.ago)

    # ไปที่หน้า brag document
    visit brag_document_path

    # เช็คว่าเนื้อหามีครบ
    expect(page).to have_content("Finished Quest")
  end

  
end
