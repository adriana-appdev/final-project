# == Schema Information
#
# Table name: favorites
#
#  id            :integer          not null, primary key
#  coffee_chain  :string
#  size          :string
#  drinks_id     :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  type_of_drink :string
#

class Favorite < ApplicationRecord
    
    belongs_to :drinks, :class_name => "Drink"
    belongs_to :user
    
    validates :coffee_chain, :presence => true 
    validates :size, :presence => true 
    validates :type_of_drink, :presence => true 
    validates :user_id, :presence => true 
end
