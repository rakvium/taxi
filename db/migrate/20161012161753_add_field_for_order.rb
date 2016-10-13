class AddFieldForOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :AdresFrom, :string
    add_column :orders, :AdresTo, :string
  end
end
