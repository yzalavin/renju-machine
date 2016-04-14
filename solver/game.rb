GRID_SIZE = 15
FIEDLS_TO_WIN = 5

# 0 - empty, 1 - enemy, 2 - me
class Game
  attr_reader :elements
  def initialize(params = {})
    @elements = params[:el]
  end

  def next_step(state, el)
    char = el[0]
    numb = el[1..-1].to_i
    index = ('a'..'o').to_a.index(char)
    step = ('a'..'o').to_a[[-1,0,1].sample + index] + ([-1,0,1].sample + numb).to_s
    loop do
      break unless state.include?(step)
      step = ('a'..'o').to_a[[-1,0,1].sample + index] + ([-1,0,1].sample + numb).to_s
    end
    step
    # ('a'..'o').to_a.sample + (rand(15) + 1).to_s
  end
end
