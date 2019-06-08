class UsersController < ApplicationController
  
  def index
    @users = User.all.order({ :username => :asc })

    render("user_templates/index.html.erb")
  end

end
