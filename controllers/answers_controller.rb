get '/answers' do
	@answer = Answer.all

	erb :"answers/show"
end

get '/answers/new/:id' do
	@question = Question.find(params[:id])
	erb :"answers/new"
end

post '/answers/new/:id' do
	@question = Question.find(params[:id])
	@answer = Answer.create(username: params[:username], text: params[:text], question_id: @question.id)

	erb :"answers/newdone"
end

