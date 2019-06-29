#rout ()
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require("sinatra/activerecord")
require('./lib/question')
require('./lib/quiz')
require('pg')
require('pry')
set :bind,'0.0.0.0'

get '/' do
  @list = Quiz.all
  erb(:home)
end

get '/add' do
  erb(:add)
end

post '/quiz' do
  @@quiz = Quiz.new(
    :name => params['quiz'],
    :correct => 0
   )
  @@quiz.save
  erb(:start)
end

post '/quiz_start' do
  x = rand(13)
  y = rand(13)
  solution = 0
  @operation = params["operation"]

  if @operation == "*"
    solution = x * y
  elsif @operation == "+"
    solution = (x + y).round
  elsif @operation == "-"
    solution = (x - y)
  end

  @question = @@quiz.questions.new(
    :x => x,
    :y => y,
    :operation => @operation,
    :solution => solution
  )
  @question.save
  erb(:quiz)
end

post '/quiz_begin/:operation' do
  @question = @@quiz.questions.last

  is_correct = (params['answer'].to_i) == @question.solution
  @@quiz.update(correct: @@quiz.correct + (is_correct ? 1 : 0))

  x = rand(13)
  y = rand(13)

  if params['operation'] == "*"
    solution = x * y
  elsif params['operation'] == "+"
    solution = (x + y).round
  elsif params['operation'] == "-"
    solution = (x - y)
  end

  @question = @@quiz.questions.new(
    x: x,
    y: y,
    operation: params['operation'],
    solution: solution
  )
  erb(:quiz)
end
