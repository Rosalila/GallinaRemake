class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :sentence
      t.string :wanted
      t.string :not_wanted
      t.integer :metric_id
      t.integer :question_type_id

      t.timestamps null: false
    end
  end
end
