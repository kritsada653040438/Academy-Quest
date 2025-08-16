class UpdateQuestsConstraints < ActiveRecord::Migration[8.0]
  def change
    change_column_null :quests, :title, false
    change_column_null :quests, :status, false
    change_column_default :quests, :status, from: nil, to: false

    # เพิ่ม index ถ้าอยากค้นหาจาก title
    add_index :quests, :title
  end
end
