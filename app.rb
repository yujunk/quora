# Specify gemfile Location and general variables

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

puts ENV['BUNDLE_GEMFILE']

# Perform requiring gem that we need

######################################################################

# basic

require 'rubygems'

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

require 'pathname'

require 'pg'

require 'active_record'

require 'sinatra'

APP_ROOT = Pathname.new(File.expand_path('../', __FILE__))

require APP_ROOT.join('config', 'database')

get '/' do

 erb :"home"

end

get '/questions/new' do #indicates the URL#

erb :"questions/new"

end 

#https://learn.co/lessons/sinatra-forms-params-readme-walkthrough

#post or get - is controller action
post '/questions' do 
	##What is happening in the background: 
	# params = {
	# 	:username => username,
	# 	:text => text
	# }

	## Test 1:
	# params.to_s

	## Test 2:
	#{}"My name is #{params[:username]}, and my question is - #{params[:text]}"

	## Test 3:
	question = Question.new(username: params[:username], text: params[:text], upvote: params[:upvote])
	question.save
	#or Question.create(xxxx...) so without the .save
	@questions = Question.all
	#need to include @ in front of object because it needs to pass to show.erb html

	erb :"questions/show"
	#need to include this otherwise it wont pass info to show.erb for html to print
end

get '/questions/edit/:id' do
	
	@find_id = Question.find_by(id: params[:id])

	erb :"questions/edit"

end

post '/questions/edit/:id' do
	@find_id = Question.find_by(id: params[:id])
	p params

	if @find_id
		@find_id.update(username: params[:username], text: params[:text], upvote: params[:upvote])
	end

	@questions = Question.all

	erb :"questions/show"
end

get '/questions/:id' do
	@question = Question.find_by(params[:id])

	erb :"questions/showid"
end


