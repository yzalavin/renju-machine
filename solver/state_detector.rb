class StateDetector
  attr_reader :steps, :human_steps, :machine_steps
  attr_accessor :human_vertical

  def initialize(steps)
    @steps = steps
    @human_steps = steps.select.with_index { |s,i| i.even? }.sort
    @machine_steps = steps.select.with_index { |s,i| i.odd? }.sort
    @human_vertical = {}
  end

  def detect
    return :in_process if steps.length < 9
    verify_vertical
  end

  private

  def verify_vertical
    fill_vertical_hash
    win_by_vertical?
  end

  def fill_vertical_hash
    human_steps.each do |h|
      char = h[0]
      numb = h[1].to_i
      human_vertical[char] = [] unless human_vertical[char]
      human_vertical[char].push(numb)
    end
  end

  def win_by_vertical?
    human_vertical.each do |k,v|
      next unless v.length > 4
      matched = 1
      start = v[0]
      v[1..-1].each do |n|
        start + 1 == n ? matched += 1 : matched = 1
        start = n
        return :human_wins if matched > 4
      end
    end
  end
end
