require 'sinatra'
require_relative 'solver'

enable :sessions

get '/' do
  session[:game] = %w(h8)
  erb :main, locals: { grid_size: GRID_SIZE }
end

post '/step' do
  next_step = Game.new.next_step
  session[:game].concat([params['el'], next_step])
  next_step
end
