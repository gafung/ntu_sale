class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :queue

      t.timestamps null: false
    end
  end
end
