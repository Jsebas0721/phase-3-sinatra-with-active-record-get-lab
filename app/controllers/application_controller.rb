class ApplicationController < Sinatra::Base
  
  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    
    # returns a single bakery as JSON with its baked goods nested in an array. Use the id from the URL to look up the correct bakery. 
    # (HINT: you'll need to pass in some custom options to the #to_jsonLinks to an external site. method.)
    bake = Bakery.find(params[:id])

    bake.to_json(include: :baked_goods)

  end

  get '/baked_goods/by_price' do
    
    baked_goods = BakedGood.all.order(price: :desc)

    baked_goods.to_json

  end

  get '/baked_goods/most_expensive' do
    
    baked_goods = BakedGood.all.order(price: :desc).first

    baked_goods.to_json

  end

end
