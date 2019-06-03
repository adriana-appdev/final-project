class DropCoffeechainidFromFavoirtes < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :coffee_chain_id
  end
end
