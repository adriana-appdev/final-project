class UsersController < ApplicationController
  
  def index
    @users_all = User.all.order({ :username => :asc })

    @users = User.where({:id => params.fetch("id")}).first
    @user_intake = @users.caffeine_servings.order( {:created_at => :desc})
    
    render("user_templates/index.html.erb")
  end

end
