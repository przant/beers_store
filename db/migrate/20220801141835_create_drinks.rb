class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.string :name
      t.text :description
      t.text :ingredients
      t.float :price

      t.timestamps
    end
  end
end
