class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name, default: ""
      t.integer :member_count
      t.integer :status, null: false
      t.string :thumbnail

      t.timestamps
    end
  end
end
