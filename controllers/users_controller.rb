#def generate_random_string


### AUTHENTICATION
get "/register" do 
	erb :'users/register'
end

post "/register" do
	array = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
	string = (0...10).map { array[rand(array.length)] }.join
	check = User.find_by(random_string: string)

	while (string == check)
		array = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
		string = (0...10).map { array[rand(array.length)] }.join

		check = User.find_by(random_string: string)
	end
	
	user = User.create(username: params[:username], password: params[:password], random_string: string)
	cookies[:id] = @user.random_string
 	redirect "/login"
end

## Added random strings to each user
# count = 0
# while count < User.all.length
# 	array = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
# 	string = (0...10).map { array[rand(array.length)] }.join

# 	user = User.find(count+1)
# 	user.update(random_string: string)

# 	count += 1
# end


### AUTHORIZATION
get "/login" do
  erb :'users/login'
end

post "/login" do
  	@user = User.find_by(username: params[:username], password: params[:password])

  	if @user 
		cookies[:id] = @user.random_string
		redirect "/" #redirect brings to action controller and does all action controller itens, erb just displays the html but then you would have to code everything again within the current action controller.
	else
		redirect "/register"
	end
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

#https://stackoverflow.com/questions/88311/how-to-generate-a-random-string-in-ruby
	
	#LONG WAY:
	# alphabets = [('a'..'z'), ('A'..'Z')]
	# alphabet_array = alphabets.map { |a| a.to_a }
	# array = alphabet_array.flatten
	# random_letter = array[rand(array.length)]
	# string = (0..15).map { random_letter }.join
		#0..15 interchangeable with (a..o) or 15.times - cause it is cycling through the elements

	##.map just iterates buts you need to tell it what to do, therefore include &:to_a (like .each do something)

	## EXPLANATION (&:x)
	#p = 'item'
	#Product.all.map(&:p) 
	#-- is the same as below --
	#Product.all.map { |x| x.p }