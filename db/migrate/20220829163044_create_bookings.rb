class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :offer, null: false, foreign_key: true
      t.date :begin_date
      t.date :end_date
      t.string :status
      t.timestamps
    end
    add_column :bookings, :buyer_id, :integer
    add_foreign_key :bookings, :users, column: :buyer_id, null: false
  end
end
