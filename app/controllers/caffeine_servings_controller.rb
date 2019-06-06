class CaffeineServingsController < ApplicationController
  def index
    @caffeine_servings = CaffeineServing.all

    render("caffeine_serving_templates/index.html.erb")
  end

  def show
    @caffeine_serving = CaffeineServing.find(params.fetch("id_to_display"))

    render("caffeine_serving_templates/show.html.erb")
  end

  def new_form
    @caffeine_serving = CaffeineServing.new

    render("caffeine_serving_templates/new_form.html.erb")
  end

  def create_row
    @caffeine_serving = CaffeineServing.new

    @caffeine_serving.coffee_chain = params.fetch("coffee_chain")
    @caffeine_serving.user_id = params.fetch("user_id")
    @caffeine_serving.drinks_id = params.fetch("drinks_id")

    if @caffeine_serving.valid?
      @caffeine_serving.save

      redirect_back(:fallback_location => "/caffeine_servings", :notice => "Caffeine serving created successfully.")
    else
      render("caffeine_serving_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @caffeine_serving = CaffeineServing.find(params.fetch("prefill_with_id"))

    render("caffeine_serving_templates/edit_form.html.erb")
  end

  def update_row
    @caffeine_serving = CaffeineServing.find(params.fetch("id_to_modify"))

    @caffeine_serving.caffeine_amount = params.fetch("caffeine_amount")
    @caffeine_serving.coffee_chain = params.fetch("coffee_chain")
    @caffeine_serving.user_id = params.fetch("user_id")
    @caffeine_serving.drinks_id = params.fetch("drinks_id")

    if @caffeine_serving.valid?
      @caffeine_serving.save

      redirect_to("/caffeine_servings/#{@caffeine_serving.id}", :notice => "Caffeine serving updated successfully.")
    else
      render("caffeine_serving_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @caffeine_serving = CaffeineServing.find(params.fetch("id_to_remove"))

    @caffeine_serving.destroy

    redirect_to("/caffeine_servings", :notice => "Caffeine serving deleted successfully.")
  end
end
