require("bundler/setup")
require 'pry'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @shoes = Shoe.all()
  @stores = Store.all()
  erb(:index)
end

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




# CURRENT ITEM TO WORK ON
get '/store/:id' do
  @store = Store.find(params[:id])
  @shoes = Shoe.all()
  @unstocked_shoes = @shoes - @store.shoes
  erb(:store_info)
end
# END CURRENT ITEM TO WORK ON

post '/store/:id' do
  @store = Store.find(params.fetch('id').to_i())
  @store.delete()
  @stores = Store.all()
  redirect '/'
end


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

  erb(:shoe_info)
end
