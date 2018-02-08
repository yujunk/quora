require 'sinatra'
require "sinatra/cookies"


#Authentication
get "/register" do 
	erb :'users/new'
end

post "/register" do
	@registration = User.create(username: params[:username], password: params[:password])

	erb :'home'
end





#Authorization
get "/users" do
  @name = nil || cookies[:name]
  erb :'home'
end

post "/users" do
  cookies[:username] = params["username"]
  cookies[:password] = params["password"]
  redirect "/users" #redirect 
end




