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
        
        drink_selec = @drinks_by_vendor_size.where(:type_of_drink => drink)
        daily_drink_selec = drink_selec.where(:created_at => Date.today.all_day)
        @daily_amount = daily_drink_selec.sum(:caffeine_amount)

        @current_user = User.where(:id => session[:user_id]).first
        
        # USER IS NOT BEING SAVED CORRECTLY - solve this when we doo the 
        # NOT ALL COMBINATION OF CHAIN-SIZE-DRINK TYPE WORK, THESE VALUES WERE INCLUDED BASED ON HOW EACH STORE CALLS THEM
        
        p = CaffeineServing.new
        
        p.caffeine_amount = @caf_amount
        p.user_id = @current_user
        p.coffee_chain = @coffee_chain
        p.type_of_drink = @drink_type
        p.size = @size
        
        p.save 
        render("result_templates/calc_result.html.erb")
    end 
    
end 

# CREATE VALIDATIONS/SAVE NEW ROWS LOOK AT https://ide.c9.io/adrianabrito/msm_queries_excercise