class AddTypeofdrinkToCaffeineserving < ActiveRecord::Migration[5.1]
  def change
    add_column :caffeine_servings, :type_of_drink, :string
  end
end
