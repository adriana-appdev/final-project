class CreateCaffeineServings < ActiveRecord::Migration[5.1]
  def change
    create_table :caffeine_servings do |t|
      t.float :caffeine_amount
      t.string :coffee_chain
      t.integer :user_id
      t.integer :drinks_id

      t.timestamps
    end
  end
end
