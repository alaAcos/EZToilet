class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :toilet, null: false, foreign_key: true
      t.datetime :date
      t.string :status
      t.datetime :duration

      t.timestamps
    end
  end
end
