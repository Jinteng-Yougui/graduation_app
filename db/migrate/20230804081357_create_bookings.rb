class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :title
      t.text :content
      t.date :date_on

      t.timestamps
    end
  end
end
