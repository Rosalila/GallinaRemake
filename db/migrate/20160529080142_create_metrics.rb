class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string :name
      t.text :description
      t.integer :weight
      t.integer :corral_id
      t.integer :metric_type_id

      t.timestamps null: false
    end
  end
end
