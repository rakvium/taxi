class NewFieldsToDriver < ActiveRecord::Migration[5.0]
  def change
  	add_column :drivers, :license_plate, :string
  	add_column :drivers, :car_model, :string
  	add_column :drivers, :car_color, :string
  	add_column :drivers, :car_type, :string
  end
end
