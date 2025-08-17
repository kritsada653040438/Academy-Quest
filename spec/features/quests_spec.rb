require 'rails_helper'

RSpec.feature "Quests", type: :feature do
  scenario "user visits quests page" do
    visit quests_path
    expect(page).to have_content("Kritsada Mahanam")
    expect(page).to have_content("My Academy Quests")
  end

  scenario "user can go to Brag Document page" do
    visit quests_path
    click_link "Brag Document"
    expect(page).to have_content("My Brag Document")
  end

  scenario "user can add quest and see it in the list" do
    visit quests_path

    # หา input ด้วย placeholder (ตรงกับที่คุณเขียนใน view)
    fill_in "What's your next adventure? Type your quest here...", with: "New Quest"

    # กดปุ่มตามข้อความจริง
    click_button "🚀 Add Quest"

    # ตรวจสอบว่ามี Quest ใหม่โผล่มา
    expect(page).to have_content("New Quest")
  end

  scenario "user can delete quest and doesn't see it in the list" do
    visit quests_path

    # หา input ด้วย placeholder (ตรงกับที่คุณเขียนใน view)
    fill_in "What's your next adventure? Type your quest here...", with: "Wait for delete quest"

    # กดปุ่มตามข้อความจริง
    click_button "🚀 Add Quest"

    # ตรวจสอบว่ามี Quest ใหม่โผล่มา
    expect(page).to have_content("Wait for delete quest")

    # ลบ Quest
    find('button[aria-label="Desktop_Delete"]').click

    # ตรวจสอบว่า Quest หายไป
    expect(page).to have_no_content("Wait for delete quest", wait: 5)
  end
end
