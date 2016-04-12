require 'sinatra'
require_relative 'solver'

get '/' do
  erb :main, locals: { grid_size: GRID_SIZE }
end
