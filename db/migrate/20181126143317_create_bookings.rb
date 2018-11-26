class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :date
      t.string :status
      t.references :user, foreign_key: true
      t.references :pool, foreign_key: true

      t.timestamps
    end
  end
end
