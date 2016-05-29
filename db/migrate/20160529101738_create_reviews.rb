class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :score
      t.integer :question_id
      t.integer :user_id
      t.integer :reviewed_id

      t.timestamps null: false
    end
  end
end
