class CreateTalkRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :talk_rooms do |t|
      t.integer :group_id, index: true
      t.integer :relationship_id, index: true
      t.string :name

      t.timestamps
    end
  end
end
