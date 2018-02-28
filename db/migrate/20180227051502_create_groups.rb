class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name, null:false
      t.integer :member_count
      t.integer :status

      t.timestamps
    end
  end
end
