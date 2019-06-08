class AddTypeofDrinktoFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :type_of_drink,:string
  end
end
