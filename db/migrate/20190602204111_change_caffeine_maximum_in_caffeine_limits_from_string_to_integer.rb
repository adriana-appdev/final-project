class ChangeCaffeineMaximumInCaffeineLimitsFromStringToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :caffeine_limits, :caffeine_maximum, :integer
  end
end
