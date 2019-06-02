class IndexController < ApplicationController
    def indexpage
        render("first_page_templates/index.html.erb")
    end

end 