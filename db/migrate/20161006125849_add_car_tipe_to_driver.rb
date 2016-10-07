class AddCarTipeToDriver < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :car_type, :string
  end
end
