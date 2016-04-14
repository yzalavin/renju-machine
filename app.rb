require 'sinatra'
require_relative 'solver'

get '/' do
  erb :main, locals: { grid_size: GRID_SIZE }
end

post '/step' do
  Game.new({}).next_step
end
