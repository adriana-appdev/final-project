class DrinksController < ApplicationController
  def index
    @drinks = Drink.all

    render("drink_templates/index.html.erb")
  end

  def show
    @drink = Drink.find(params.fetch("id_to_display"))

    render("drink_templates/show.html.erb")
  end

  def new_form
    @drink = Drink.new

    render("drink_templates/new_form.html.erb")
  end

  def create_row
    @drink = Drink.new

    @drink.size = params.fetch("size")
    @drink.caffeine_amount = params.fetch("caffeine_amount")
    @drink.coffee_chain = params.fetch("coffee_chain")
    @drink.type_of_drink = params.fetch("type_of_drink")

    if @drink.valid?
      @drink.save

      redirect_back(:fallback_location => "/drinks", :notice => "Drink created successfully.")
    else
      render("drink_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @drink = Drink.find(params.fetch("prefill_with_id"))

    render("drink_templates/edit_form.html.erb")
  end

  def update_row
    @drink = Drink.find(params.fetch("id_to_modify"))

    @drink.size = params.fetch("size")
    @drink.caffeine_amount = params.fetch("caffeine_amount")
    @drink.coffee_chain = params.fetch("coffee_chain")
    @drink.type_of_drink = params.fetch("type_of_drink")

    if @drink.valid?
      @drink.save

      redirect_to("/drinks/#{@drink.id}", :notice => "Drink updated successfully.")
    else
      render("drink_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @drink = Drink.find(params.fetch("id_to_remove"))

    @drink.destroy

    redirect_to("/drinks", :notice => "Drink deleted successfully.")
  end
end
