class ChangeCoffeeChainIdInFavoritesFromIntegerToString < ActiveRecord::Migration[5.1]
  def change
    change_column :favorites, :coffee_chain_id, :string
  end
end
