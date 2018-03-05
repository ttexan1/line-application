class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :from_user_id, null: false, index: true
      t.integer :to_user_id, null: false, index: true
      t.integer :group_id, null: false, index: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
