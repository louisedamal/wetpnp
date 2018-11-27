class AddCityToPools < ActiveRecord::Migration[5.2]
  def change
    add_column :pools, :city, :string
  end
end
