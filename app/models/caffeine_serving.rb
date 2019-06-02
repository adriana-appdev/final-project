# == Schema Information
#
# Table name: caffeine_servings
#
#  id              :integer          not null, primary key
#  caffeine_amount :float
#  coffee_chain    :string
#  user_id         :integer
#  drinks_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  type_of_drink   :string
#  size            :string
#

class CaffeineServing < ApplicationRecord
    
    belongs_to :drinks, :class_name => "Drink"
    belongs_to :user
    
end
