class AddCoffeechainToCaffeineserving < ActiveRecord::Migration[5.1]
  def change
    add_column :caffeine_servings, :size, :string
  end
end
