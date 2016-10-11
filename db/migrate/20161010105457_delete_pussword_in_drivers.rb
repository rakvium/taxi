class DeletePusswordInDrivers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :drivers, :pussword, :string
  end
end
