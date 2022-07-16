class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.integer :people_count
      t.integer :people_child_count
      t.integer :people_baby_count
      t.integer :spot_id

      t.timestamps
    end
  end
end
