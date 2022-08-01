class CreatePromos < ActiveRecord::Migration[6.1]
  def change
    create_table :promos do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: false
      t.float :price

      t.timestamps
    end
  end
end
