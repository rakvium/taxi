class AddAdresToToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :AdresTo, :string
  end
end
