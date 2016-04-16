require 'sinatra'
require_relative 'solver'

enable :sessions

get '/' do
  session[:game] = %w(h8 h9)
  erb :main, locals: { grid_size: GRID_SIZE }
end

post '/step' do
  session[:game].push(params['el'])
  p state = session[:game]
  p next_step = NextStep.new(state).choose
  state = StateDetector.new(session[:game]).detect
  session[:game].push(next_step)
  state = StateDetector.new(session[:game]).detect if state == :in_process
  state == :in_process ? next_step : "#{state},#{next_step}"
end
