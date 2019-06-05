Rails.application.routes.draw do
  devise_for :users

  match("", { :controller => "index", :action => "indexpage", :via => "get" })
  match("/calccaffeine", { :controller => "index", :action => "calccaffeine", :via => "get" })
  match("/calcresult", { :controller => "index", :action => "calcresult", :via => "get" })
  
  # Routes for the Drink resource:

  # CREATE
  get("/drinks/new", { :controller => "drinks", :action => "new_form" })
  post("/create_drink", { :controller => "drinks", :action => "create_row" })

  # READ
  get("/drinks", { :controller => "drinks", :action => "index" })
  get("/drinks/:id_to_display", { :controller => "drinks", :action => "show" })

  # UPDATE
  get("/drinks/:prefill_with_id/edit", { :controller => "drinks", :action => "edit_form" })
  post("/update_drink/:id_to_modify", { :controller => "drinks", :action => "update_row" })

  # DELETE
  get("/delete_drink/:id_to_remove", { :controller => "drinks", :action => "destroy_row" })

  #------------------------------

  # Routes for the Favorite resource:

  # CREATE
  get("/favorites/new", { :controller => "favorites", :action => "new_form" })
  post("/create_favorite", { :controller => "favorites", :action => "create_row" })

  # READ
  get("/favorites", { :controller => "favorites", :action => "index" })
  get("/favorites/:id_to_display", { :controller => "favorites", :action => "show" })

  # UPDATE
  get("/favorites/:prefill_with_id/edit", { :controller => "favorites", :action => "edit_form" })
  post("/update_favorite/:id_to_modify", { :controller => "favorites", :action => "update_row" })

  # DELETE
  get("/delete_favorite/:id_to_remove", { :controller => "favorites", :action => "destroy_row" })

  #------------------------------

  # Routes for the Caffeine limit resource:

  # CREATE
  get("/caffeine_limits/new", { :controller => "caffeine_limits", :action => "new_form" })
  post("/create_caffeine_limit", { :controller => "caffeine_limits", :action => "create_row" })

  # READ
  get("/caffeine_limits", { :controller => "caffeine_limits", :action => "index" })
  get("/caffeine_limits/:id_to_display", { :controller => "caffeine_limits", :action => "show" })

  # UPDATE
  get("/caffeine_limits/:prefill_with_id/edit", { :controller => "caffeine_limits", :action => "edit_form" })
  post("/update_caffeine_limit/:id_to_modify", { :controller => "caffeine_limits", :action => "update_row" })

  # DELETE
  get("/delete_caffeine_limit/:id_to_remove", { :controller => "caffeine_limits", :action => "destroy_row" })

  #------------------------------

  # Routes for the Caffeine serving resource:

  # CREATE - Not used. Created others instead
  get("/caffeine_servings/new", { :controller => "caffeine_servings", :action => "new_form" })
  post("/create_caffeine_serving", { :controller => "caffeine_servings", :action => "create_row" })

  # READ
  get("/caffeine_servings", { :controller => "caffeine_servings", :action => "index" })
  get("/caffeine_servings/:id_to_display", { :controller => "caffeine_servings", :action => "show" })

  # UPDATE
  get("/caffeine_servings/:prefill_with_id/edit", { :controller => "caffeine_servings", :action => "edit_form" })
  post("/update_caffeine_serving/:id_to_modify", { :controller => "caffeine_servings", :action => "update_row" })

  # DELETE
  get("/delete_caffeine_serving/:id_to_remove", { :controller => "caffeine_servings", :action => "destroy_row" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
