require 'sinatra'
require_relative 'solver'

enable :sessions

get '/' do
  session[:game] = %w(h8 h9)
  erb :main, locals: { grid_size: GRID_SIZE }
end

post '/step' do
  next_step = Game.new.next_step
  session[:game].concat([params['el'], next_step])
  state = StateDetector.new(session[:game]).detect
  state == :in_process ? next_step : state.to_s
end
