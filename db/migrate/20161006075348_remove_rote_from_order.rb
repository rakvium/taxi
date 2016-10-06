class RemoveRoteFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :rote, :string
  end
end
