# == Schema Information
#
# Table name: caffeine_limits
#
#  id               :integer          not null, primary key
#  caffeine_maximum :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class CaffeineLimit < ApplicationRecord
    
    belongs_to :user
    
end
