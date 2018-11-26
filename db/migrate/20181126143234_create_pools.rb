class CreatePools < ActiveRecord::Migration[5.2]
  def change
    create_table :pools do |t|
      t.string :title
      t.text :address
      t.text :description
      t.integer :capacity
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
