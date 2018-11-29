class AddFunDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :stroke, :string
    add_column :users, :party_quote, :string
  end
end
