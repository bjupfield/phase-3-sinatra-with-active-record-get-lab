class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end
  get '/bakeries/:id' do
    bake = Bakery.find(params[:id])
    baked = Bakery.find(params[:id]).baked_goods
    bakes = {
      name: bake.name,
      baked_goods: baked.map{|a| {
        name: a.name,
        price: a.price
      }}
    }
    bakes.to_json
  end
  get '/baked_goods/by_price' do
    BakedGood.all.sort{|a,b| b.price <=> a.price}.to_json
  end
  get '/baked_goods/most_expensive' do
    BakedGood.all.sort{|a,b| b.price <=> a.price}.first.to_json
  end
end
