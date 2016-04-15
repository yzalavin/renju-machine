require 'sinatra'
require_relative 'solver'

enable :sessions

get '/' do
  session[:game] = %w(h8 h9)
  erb :main, locals: { grid_size: GRID_SIZE }
end

post '/step' do
  session[:game].push(params['el'])
  next_step = Game.new(session[:game]).next_step
  session[:game].push(next_step)
  state = StateDetector.new(session[:game]).detect
  state == :in_process ? next_step : "#{state},#{next_step}"
end
