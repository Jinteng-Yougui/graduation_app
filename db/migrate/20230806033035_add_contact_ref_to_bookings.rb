class AddContactRefToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :contact, null: false, foreign_key: true
  end
end
