class IndexController < ApplicationController
    def indexpage
        render("first_page_templates/index.html.erb")
    end

    def calccaffeine
        render("form_templates/calc_caffeine.html.erb")
    end

    def calcresult
    
    #identify the caffeine level of each new drink consumed by the user 
         
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
        
        # check photogram asigment to know hoe to save variables 
        
        render("result_templates/calc_result.html.erb")
    end 
end 

# CREATE VALIDATIONS/SAVE NEW ROWS LOOK AT https://ide.c9.io/adrianabrito/msm_queries_excercise