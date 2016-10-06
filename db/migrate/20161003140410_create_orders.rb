class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :dispatcher_id
      t.integer :driver_id
      t.integer :status
      t.text :comment
      t.string :phone_number
      t.string :email
      t.text :rote
      t.integer :number_of_passengers
      t.datetime :date_of_trip
      t.timestamps null: false
    end
  end
end
