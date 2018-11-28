class RemoveCityFromPools < ActiveRecord::Migration[5.2]
  def change
    remove_column :pools, :city, :string
  end
end
