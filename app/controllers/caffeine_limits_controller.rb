class CaffeineLimitsController < ApplicationController
  def index
    @caffeine_limits = CaffeineLimit.all

    render("caffeine_limit_templates/index.html.erb")
  end

  def show
    @caffeine_limit = CaffeineLimit.find(params.fetch("id_to_display"))

    render("caffeine_limit_templates/show.html.erb")
  end

  def new_form
    @caffeine_limit = CaffeineLimit.new

    render("caffeine_limit_templates/new_form.html.erb")
  end

  def create_row
    @caffeine_limit = CaffeineLimit.new

    @caffeine_limit.caffeine_maximum = params.fetch("caffeine_maximum")
    @caffeine_limit.user_id = params.fetch("user_id")

    if @caffeine_limit.valid?
      @caffeine_limit.save

      redirect_back(:fallback_location => "/caffeine_limits", :notice => "Caffeine limit created successfully.")
    else
      render("caffeine_limit_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @caffeine_limit = CaffeineLimit.find(params.fetch("prefill_with_id"))

    render("caffeine_limit_templates/edit_form.html.erb")
  end

  def update_row
    @caffeine_limit = CaffeineLimit.find(params.fetch("id_to_modify"))

    @caffeine_limit.caffeine_maximum = params.fetch("caffeine_maximum")
    @caffeine_limit.user_id = params.fetch("user_id")

    if @caffeine_limit.valid?
      @caffeine_limit.save

      redirect_to("/caffeine_limits/#{@caffeine_limit.id}", :notice => "Caffeine limit updated successfully.")
    else
      render("caffeine_limit_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @caffeine_limit = CaffeineLimit.find(params.fetch("id_to_remove"))

    @caffeine_limit.destroy

    redirect_to("/caffeine_limits", :notice => "Caffeine limit deleted successfully.")
  end
end
