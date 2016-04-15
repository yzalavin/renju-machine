require 'redis'

class TrainRenju
  attr_reader :redis

  def initialize
    @redis = Redis.new
  end

  def from_dataset(examples)
    examples.each do |ex|
      train_from_example(ex)
    end
  end

  def by_simulation
  end

  private

  def train_from_example(ex)
    status = ex[:status]
    state = ex[:data]
    set_final_reward(status, state)
    state = state[1..-2] if state == :machine_wins
    while state.length > 1
      state[]
      # redis.set("state:#{state.join}") if redis.get("state:#{state.join}").nil?
      # redis.zadd
      state = state[1..-3]
  end

  def set_final_reward(status, state)
    case status
    when :machine_wins
      redis.set("rewards:#{state.join}", 1)
    when :draw
      redis.set("rewards:#{state.join}", 0)
    when :human_wins
      redis.set("rewards:#{state.join}", -1)
    end
  end
end
