class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :address
      t.integer :cost_per_day
      t.integer :cost_per_people
      t.integer :cost_per_people_child
      t.integer :cost_per_people_baby
      t.string :description_facility
      t.string :description_destination
      t.integer :category_id
      t.integer :max_people_count

      t.timestamps
    end
  end
end
