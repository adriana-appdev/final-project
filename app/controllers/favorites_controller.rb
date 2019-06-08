class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all

    render("favorite_templates/index.html.erb")
  end

  def show
    @favorite = Favorite.find(params.fetch("id_to_display"))

    render("favorite_templates/show.html.erb")
  end

  def new_form
    @favorite = Favorite.new

    render("favorite_templates/new_form.html.erb")
  end

  def create_row
    @favorite = Favorite.new

    @favorite.coffee_chain = params.fetch("coffee_chain")
    @favorite.size = params.fetch("size")
    @favorite.type_of_drink = params.fetch("type_of_drink")
    
    #@favorite.user_id = params.fetch("user_id")
    @favorite.user_id = User.where(:id => session[:user_id]).first
    
    # @favorite.drinks_id = params.fetch("drinks_id") 
    #chain= params.fetch("coffee_chain").to_s
    #size = params.fetch("size").to_s
    #type = params.fetch("type_of_drink").to_s
    #fav_chain = Drink.where(:coffee_chain => chain)
    #fav_size = fav_chain.where(:size => size)
    #fav_type = fav_size.where(:type_of_drink => type)
    #fav_drink = fav_type.pluck(:id).at(0)
    
    #@favorite.drinks_id = fav_drink
    
    if @favorite == nil 
      render("favorite_templates/new_form_with_errors.html.erb")
    end 
      
    if @favorite.valid?
      @favorite.save

      redirect_back(:fallback_location => "/favorites", :notice => "Favorite created successfully.")
    else
      render("favorite_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @favorite = Favorite.find(params.fetch("prefill_with_id"))

    render("favorite_templates/edit_form.html.erb")
  end

  def update_row
    @favorite = Favorite.find(params.fetch("id_to_modify"))

    @favorite.coffee_chain = params.fetch("coffee_chain")
    @favorite.size = params.fetch("size")
    @favorite.drinks_id = params.fetch("drinks_id")
    @favorite.type_of_drink = params.fetch("type_of_drink")
    @favorite.user_id = params.fetch("user_id")

    if @favorite.valid?
      @favorite.save

      redirect_to("/favorites/#{@favorite.id}", :notice => "Favorite updated successfully.")
    else
      render("favorite_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @favorite = Favorite.find(params.fetch("id_to_remove"))

    @favorite.destroy

    redirect_to("/favorites", :notice => "Favorite deleted successfully.")
  end
end
