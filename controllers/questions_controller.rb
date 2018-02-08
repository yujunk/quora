get '/' do
 	erb :"home"
end

get '/questions/new' do
	erb :"questions/new"
end 

get '/questions' do
	@questions = Question.all

	erb :"questions/show"
end

post '/questions/new/done' do 
	question = Question.create(username: params[:username], text: params[:text], upvote: params[:upvote])
	# <#Question:1233 id: 1, username: slwkerjle>
	@id_new_done = question.id
	@username_new_done = question.username
	@text_new_done = question.text

	erb :"questions/newdone"
end

get '/questions/edit/:id' do	#/questions/:id/edit - is the convention
	@find_id = Question.find_by(id: params[:id])

	erb :"questions/edit"

end

put '/questions/edit/:id' do
	@find_id = Question.find_by(id: params[:id])

	@find_id.update(username: params[:username], text: params[:text], upvote: params[:upvote])
	#true
	#can't put into object and ask for column .id

	@id_new_done = @find_id.id
	@username_new_done = @find_id.username
	@text_new_done = @find_id.text

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
	@question = Question.find(params[:id]) #find is always for id, find_by is for anything else
	@answers_from_question = @question.answers
	
	erb :"questions/showid"
end


