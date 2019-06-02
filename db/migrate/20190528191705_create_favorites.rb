class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :coffee_chain_id
      t.integer :size
      t.integer :drinks_id
      t.integer :user_id

      t.timestamps
    end
  end
end
