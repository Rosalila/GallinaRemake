class CreateGallinas < ActiveRecord::Migration
  def change
    create_table :gallinas do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :corral_id

      t.timestamps null: false
    end
  end
end
