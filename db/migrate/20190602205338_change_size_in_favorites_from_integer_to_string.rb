class ChangeSizeInFavoritesFromIntegerToString < ActiveRecord::Migration[5.1]
  def change
    change_column :favorites, :size, :string
  end
end
