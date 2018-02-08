#refactored
get '/' do
	@user = User.find_by(id: cookies[:id])
	if @user
		erb :"home"
	else
		redirect "/login"
	end
end

#not refactored
get '/questions/new' do

	if User.find_by(id: cookies[:id])
		@user = User.find_by(id: cookies[:id])
		erb :"questions/new"
	else
		redirect "/login"
	end
end 

#refactored following
get '/questions' do
	@user = User.find_by(id: cookies[:id])
	if @user
		@questions = Question.all
		erb :"questions/show"
	else
		redirect "/login"
	end

end

post '/questions/new/done' do 
	@questions = Question.create(username: params[:username], text: params[:text], upvote: params[:upvote])

	erb :"questions/newdone"
end

get '/questions/edit/:id' do	
	@find_id = Question.find_by(id: params[:id])

	erb :"questions/edit"

end

put '/questions/edit/:id' do
	@find_id = Question.find_by(id: params[:id])

	@find_id.update(username: params[:username], text: params[:text], upvote: params[:upvote])

	erb :"questions/newdone"
end

get '/questions/delete/:id' do
	@find_id = Question.find_by(id: params[:id])

	erb :"questions/delete"
end

delete '/questions/delete/:id' do
	@find_id = Question.find_by(id: params[:id])
	@find_id.delete
	@find_id.save

	erb :"home"

end

get '/questions/:id' do
	@question = Question.find(params[:id]) 
	@answers_from_question = @question.answers
	
	erb :"questions/showid"
end


