require 'redis'
require_relative 'next_step'

GRID_SIZE = 15
FIEDLS_TO_WIN = 5

class Game
  attr_reader :state, :last, :redis

  def initialize(state)
    @state = state.sort
    @last = state.last
    @redis = Redis.new
  end

  def next_step
    # return redis_step unless redis_step.nil?
    cover = NextStep.new(state).choose
    # return cover unless cover.nil? || state.include?(cover)
    # random_close_step
  end

  private

  def random_close_step
    char = last[0]
    numb = last[1..-1].to_i
    index = ('a'..'o').to_a.index(char)
    step = ('a'..'o').to_a[[-1,0,1].sample + index] + ([-1,0,1].sample + numb).to_s
    loop do
      break unless state.include?(step)
      step = ('a'..'o').to_a[[-1,0,1].sample + index] + ([-1,0,1].sample + numb).to_s
    end
    step
  end

  def redis_step
    redis.get("next_step:#{state.join}")
  end
end
