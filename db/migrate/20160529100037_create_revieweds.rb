class CreateRevieweds < ActiveRecord::Migration
  def change
    create_table :revieweds do |t|
      t.string :name
      t.integer :gallina_id

      t.timestamps null: false
    end
  end
end
