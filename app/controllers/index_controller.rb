class IndexController < ApplicationController
    def indexpage
        render("first_page_templates/index.html.erb")
    end

    def calccaffeine
        render("form_templates/calc_caffeine.html.erb")
    end

    def calcresult
        # NEED TO DO AN IF to MATCH INPUT WITH TABLE
        render("result_templates/calc_result.html.erb")
    end 

end 