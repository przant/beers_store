class CreateSnacks < ActiveRecord::Migration[6.1]
  def change
    create_table :snacks do |t|
      t.string :name
      t.text :description
      t.text :ingredients
      t.float :price

      t.timestamps
    end
  end
end
