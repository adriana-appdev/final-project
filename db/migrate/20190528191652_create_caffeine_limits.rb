class CreateCaffeineLimits < ActiveRecord::Migration[5.1]
  def change
    create_table :caffeine_limits do |t|
      t.integer :caffeine_maximum
      t.integer :user_id

      t.timestamps
    end
  end
end
