class CreateCorrals < ActiveRecord::Migration
  def change
    create_table :corrals do |t|
      t.string :name
      t.string :image
      t.text :description
      t.text :agreement

      t.timestamps null: false
    end
  end
end
