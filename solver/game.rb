GRID_SIZE = 15
FIEDLS_TO_WIN = 5

# 0 - empty, 1 - enemy, 2 - me
class Game
  def initialize(params)
    matrix = []
  end

  def next_step
    ('a'..'o').to_a.sample + (rand(15) + 1).to_s
  end

  private

  def rewards
  end

  def update_values
  end
end
