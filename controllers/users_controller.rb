#Authentication
get "/register" do 
	erb :'users/register'
end

post "/register" do
	User.create(username: params[:username], password: params[:password])
	
	redirect "/login"
end





#Authorization
get "/login" do
  erb :'users/login'
end

post "/login" do
  	@user = User.find_by(username: params[:username], password: params[:password])

  	cookies[:id] = @user.id

  redirect "/" #redirect brings to action controller and does all action controller itens, erb just displays the html but then you would have to code everything again within the current action controller.
end

#Logging Out
get "/logout" do
	cookies.clear

	redirect "/login"
end



#cookies[:username] = params["username"]
#cookies[:password] = params["password"]

#@username = nil || cookies[:username]

#https://learn.co/lessons/sinatra-user-auth