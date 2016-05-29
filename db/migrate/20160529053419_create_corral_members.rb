class CreateCorralMembers < ActiveRecord::Migration
  def change
    create_table :corral_members do |t|
      t.integer :corral_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
