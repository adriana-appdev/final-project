namespace :slurp do
  desc "TODO"
  
   task limit: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "caffeine_limit.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1", :col_sep => ";")
    csv.each do |row|
    t = CaffeineLimit.new
    t.id = row["id"]
    t.caffeine_maximum = row["caffeine_maximum"]
    t.user_id = row["user_id"]
  
    t.save
    puts 
  end
  end 
end

# task drink: :environment do
  # require "csv"
    #csv_text = File.read(Rails.root.join("lib", "csvs", "drink.csv"))
    #csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1", :col_sep => ";")
    #csv.each do |row|
    #t = Drink.new
    #t.id = row["id"]
    #t.coffee_chain = row["coffee_chain"]
    #t.size = row["size"]
    #t.type_of_drink = row["type_of_drink"]
    #t.caffeine_amount = row["caffeine_amount"]
  
    #t.save
    #puts 
  #end
  
  #task servings: :environment do
  #  require "csv"

    #csv_text = File.read(Rails.root.join("lib", "csvs", "caffeine_servings.csv"))
    #csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1", :col_sep => ";")
    #csv.each do |row|
    #t = CaffeineServing .new
    #t.id = row["id"]
    #t.caffeine_amount = row["caffeine_amount"]
    #t.coffee_chain = row["coffee_chain"]
    #t.user_id = row["user_id"]
    #t.drinks_id = row["drinks_id"]
  
    #t.save
    #puts 
  #end