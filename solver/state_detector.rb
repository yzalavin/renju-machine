class StateDetector
  attr_reader :steps, :human_steps, :machine_steps
  attr_accessor :human_vertical, :machine_vertical, :human_horizontal, :machine_horizontal

  def initialize(steps)
    @steps = steps
    @human_steps = steps.select.with_index { |s,i| i.even? }.sort
    @machine_steps = steps.select.with_index { |s,i| i.odd? }.sort
    @human_vertical = {}
    @machine_vertical = {}
  end

  def detect
    return :in_process if steps.length < 9
    return :draw if steps.length == 225
    return verify_vertical unless verify_vertical == :in_process
    return verify_horizontal unless verify_horizontal == :in_process
    :in_process
  end

  private

  def verify_vertical
    initialize_vertical_hashes
    fill_vertical_hash
    win_by_vertical?
  end

  def verify_horizontal
    initialize_horizontal_hashes
    fill_horizontal_hash
    win_by_horizontal?
  end

  def initialize_vertical_hashes
    @human_vertical = {}
    @machine_vertical = {}
  end

  def initialize_horizontal_hashes
    @human_horizontal = {}
    @machine_horizontal = {}
  end

  def fill_vertical_hash
    [human_steps, machine_steps].each_with_index do |arr,i|
      hash = i == 0 ? human_vertical : machine_vertical
      arr.each do |el|
        char = el[0]
        numb = el[1..-1].to_i
        hash[char] = [] unless hash[char]
        hash[char].push(numb)
        hash[char].sort!
      end
    end
  end

  def fill_horizontal_hash
    [human_steps, machine_steps].each_with_index do |arr,i|
      hash = i == 0 ? human_horizontal : machine_horizontal
      arr.each do |el|
        numb = el[1..-1]
        char = ('a'..'o').to_a.index(el[0]) + 1
        hash[numb] = [] unless hash[numb]
        hash[numb].push(char)
        hash[numb].sort!
      end
    end
  end

  def win_by_vertical?
    [human_vertical, machine_vertical].each_with_index do |h, i|
      winner = i == 0 ? :human_wins : :machine_wins
      h.each do |k,v|
        next unless v.length > 4
        matched = 1
        start = v[0]
        v[1..-1].each do |n|
          start + 1 == n ? matched += 1 : matched = 1
          start = n
          return winner if matched > 4
        end
      end
    end
    :in_process
  end

  def win_by_horizontal?
    [human_horizontal, machine_horizontal].each_with_index do |h, i|
      winner = i == 0 ? :human_wins : :machine_wins
      h.each do |k,v|
        next unless v.length > 4
        matched = 1
        start = v[0]
        v[1..-1].each do |n|
          start + 1 == n ? matched += 1 : matched = 1
          start = n
          return winner if matched > 4
        end
      end
    end
    :in_process
  end
end
