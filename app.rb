require 'bundler'
Bundler.require()


ActiveRecord::Base.establish_connection(
  :adapter =>'postgresql',
  :database =>'productive_shiz'
)

require './models/todo.rb'

get '/' do
  erb :index
end

#get all to-do items
 get '/api/todos' do
  content_type :json
  Todo.all.to_json
 end

 #get a specific to-do item
get '/api/todos/:id' do
  content_type :json
  todo = Todo.find(params[:id].to_i)
  todo.to_json
end



#create new to-do item
post '/api/tools' do
  content_type :json
  Todo.create(params[:todo]).to_json
end

#udpate specific to-do item
put '/api/tools/:id' do
  content_type :json
  todo = Todo.find(params[:id].to_i)
  todo.update(params[:todo]).tojson
end

#udpate specific to-do item
patch '/api/tools/:id' do
  content_type :json
  todo = Todo.find(params[:id].to_i)
  todo.update(params[:todo]).tojson
end

delete '/api/tools/:id' do
  content_type :json
  todo = find(params[:is].to_i)
  todo.delete(params[:todo])
  {message: '#BYEEEE'}.to_json
end
