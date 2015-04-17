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
  todos = Todo.all
  todos.to_json
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
  todo = Todo.create(params[:todo])
  todo.to_json
end

#udpate specific to-do item
put '/api/tools/:id' do
  content_type :json
  todo = Todo.find(params[:id].to_i).update(params[:todo])
  todo.to_json

end

#udpate specific to-do item
patch '/api/tools/:id' do
  content_type :json
  todo = Todo.find(params[:id].to_i).update(params[:todo]).tojson
  todo.to_json
end


delete '/api/tools/:id' do
  content_type :json
  id = find(params[:is].to_i)
  Todo.delete(id)
  {message: '#BYEEEE'}.to_json
end
