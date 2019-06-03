class IndexController < ApplicationController
    def indexpage
        render("first_page_templates/index.html.erb")
    end

    def calccaffeine
        render("form_templates/calc_caffeine.html.erb")
    end

    def calcresult
    
    #identify the caffeine level of each new drink consumed by the user 
        @coffee_chain = params.fetch("coffee_chain")
        @size = params.fetch("size")
        @drink_type = params.fetch("drink")
        
        amount = Drink.where(:coffee_chain => @coffee_chain).where(:size => @size).where(:type_of_drink => @drink_type).pluck(:caffeine_amount)
        @caf_amount = amount 
        
        render("result_templates/calc_result.html.erb")
    end 
end 

# CREATE VALIDATIONS/SAVE NEW ROWS LOOK AT https://ide.c9.io/adrianabrito/msm_queries_excercise