class CreateUsersGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :users_groups do |t|
      t.integer :user_id, null: false, index: true
      t.integer :group_id, null: false, index: true

      t.timestamps
    end
  end
end
