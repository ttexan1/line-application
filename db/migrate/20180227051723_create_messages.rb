class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :group_id, null: false
      t.integer :user_id, null: false
      t.text :content
      t.integer :read_count, default: 0

      t.timestamps
    end
  end
end
