require("bundler/setup")
require("pry")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  erb(:index)
end

get('/store/new') do
  erb(:store_form)
end

post('/stores') do
  store = params.fetch('new_store')
  newstore = Store.create({:name => store})
  @stores = Store.all()
  erb(:index)
end

get('/store/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @shoes = @store.shoes.all()
  erb(:store)
end

get('/store/:id/update') do
  @store = Store.find(params.fetch('id').to_i())
  erb(:store_edit_form)
end


patch('/store/:id') do
  @store = Store.find(params.fetch('id').to_i())
  update_store = params.fetch('new_store')
  @store.update({:name => update_store})
  erb(:store)
end

delete("/store/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete()
  @stores = Store.all()
  erb(:index)
end


get('/stores/brands') do
  @stores = Store.all
  @brands = Brand.all
  erb(:brands)
end

get ('/store/:id/shoe/new') do
  @store = Store.find(params.fetch("id").to_i())
  erb(:shoe_form)
end

get ('/brand/new') do
  @store = Store.find(params.fetch("id").to_i())
  erb(:shoe_form)
end

post('/store/:id/shoes') do
  @store = Store.find(params.fetch('id').to_i())
  brand = params.fetch('new_brand')
  price = params.fetch('price')
  Brand.create({:price => price, :name => brand, :store_ids => [@store.id()]})
  @shoes = @store.shoes.all()
  erb(:store)
end

patch('/brand/:id') do
  brand_id = params.fetch("id").to_i()
  @brand = Brand.find(brand_id)
  store_ids = params.fetch("store_ids")
  @brand.update({:store_ids => store_ids})
  @stores = Store.all()
  erb(:brand_store_list)
end

get('/brand/:id/stores') do
  @brand = Brand.find(params.fetch('id').to_i)
  @stores = Store.all()
  erb(:brand_store_list)
end
