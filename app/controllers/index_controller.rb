class IndexController < ApplicationController
    def indexpage
        render("first_page_templates/index.html.erb")
    end

    def calccaffeine
        render("form_templates/calc_caffeine.html.erb")
    end

    def calcresult
    #Identify the caffeine level of each new drink and the total daily consumed by each user 
         
        chain = params.fetch("coffee_chain").to_s
        @coffee_chain = chain
        
        size = params.fetch("size_of_drink").to_s
        @size = size
        
        drink = params.fetch("type_of_drink").to_s
        @drink_type = drink
        
        @drinks_by_vendor = Drink.where(:coffee_chain => chain)
        @drinks_by_vendor_size = @drinks_by_vendor.where(:size => size)
        @amount = @drinks_by_vendor_size.where(:type_of_drink => drink).pluck(:caffeine_amount).at(0)
        @caf_amount = @amount
        @daily_amount = CaffeineServing.where(:created_at => Date.today.all_day).sum(:caffeine_amount)
        
        # @current_user = User.where(:id => session[:user_id]).first
        # @daily_amount =current_user.caffeine_servings.where(:created_at => Date.today.in_time_zone("America/Chicago").all_day).sum(:caffeine_amount)
        
        p = CaffeineServing.new
        
        p.caffeine_amount = @caf_amount
        p.user_id = current_user.id 
        p.coffee_chain = @coffee_chain
        p.type_of_drink = @drink_type
        p.size = @size
        
        p.save 
        render("result_templates/calc_result.html.erb")
        
    end 
    
end 

# CREATE VALIDATIONS/SAVE NEW ROWS LOOK AT https://ide.c9.io/adrianabrito/msm_queries_excercis