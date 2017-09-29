require("bundler/setup")
require 'pry'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @shoes = Shoe.all()
  @stores = Store.all()
  erb(:index)
end


# Beginning of store routing
get '/create_store' do
  @shoes = Shoe.all()
  @stores = Store.all()
  erb(:index)
end

post '/create_store' do
  name = params['name']
  store = Store.create({:name => name})
  @shoes = Shoe.all()
  @stores = Store.all()
  erb(:index)
end

get '/store/:id' do
  @store = Store.find(params[:id])
  @shoes = Shoe.all()
  @unstocked_shoes = @shoes - @store.shoes
  erb(:store_info)
end

# CURRENT ITEM TO WORK ON
post '/store/add_shoe/:id' do
  # @store = Store.find(params[:id])
  # @shoes = Shoe.all
  # shoe_ids = params['shoe_ids']
  # shoe_ids.each do |x|
  #   store.brands.push(Shoe.find(brand_id))
  # end
  # redirect "/store/#{store.id}"
end
# END CURRENT ITEM TO WORK ON

delete '/store/:id' do
  @store = Store.find(params.fetch('id').to_i())
  @store.delete()
  @stores = Store.all()
  redirect '/'
end

patch '/store/:id' do
  rename = params.fetch('rename')
  @store = Store.find(params.fetch('id').to_i())
  @store.update({:name => rename})
  @store = Store.all()
  redirect '/'
end


# Beginning of shoe routing
get '/create_shoe' do
  @shoes = Shoe.all()
  @stores = Store.all()
  erb(:index)
end

post '/create_shoe' do
  brand = params['brand']
  price = params['price']
  shoe = Shoe.create({:brand => brand, :price => price})
  @shoes = Shoe.all().sort_by {|x| x.price}
  @stores = Store.all()
  erb(:index)
end

get '/shoe/:id' do
  @shoe = Shoe.find(params[:id])
  @stores = Store.all()
  @unstocked_stores = @stores - @shoe.stores
  erb(:shoe_info)
end
