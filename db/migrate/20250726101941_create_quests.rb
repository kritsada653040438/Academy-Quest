class CreateQuests < ActiveRecord::Migration[8.0]
  def change
    create_table :quests do |t|
      t.string :title
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
