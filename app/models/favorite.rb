# == Schema Information
#
# Table name: favorites
#
#  id           :integer          not null, primary key
#  coffee_chain :string
#  size         :string
#  drinks_id    :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Favorite < ApplicationRecord
    
    belongs_to :drinks, :class_name => "Drink"
    belongs_to :user
end
