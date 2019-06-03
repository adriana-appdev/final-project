class ChangeNameAttributeInFavorite < ActiveRecord::Migration[5.1]
  def change
    rename_column :favorites, :coffee_chain_id, :coffee_chain
  end
end
