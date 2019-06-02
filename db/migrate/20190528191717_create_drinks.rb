class CreateDrinks < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks do |t|
      t.string :size
      t.float :caffeine_amount
      t.string :coffee_chain
      t.string :type_of_drink

      t.timestamps
    end
  end
end
