# == Schema Information
#
# Table name: drinks
#
#  id              :integer          not null, primary key
#  size            :string
#  caffeine_amount :float
#  coffee_chain    :string
#  type_of_drink   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Drink < ApplicationRecord
    
    has_many :caffeine_servings, :foreign_key => "drinks_id", :dependent => :destroy
    has_many :favorites, :foreign_key => "drinks_id", :dependent => :destroy
    
    validates :size, :presence => true 
    validates :coffee_chain, :presence => true 
    validates :type_of_drink, :presence => true 
end
