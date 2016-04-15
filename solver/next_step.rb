class NextStep
  attr_reader :state, :human_steps, :machine_steps

  def initialize(state)
    @state = state
    @human_steps = state.select.with_index { |s,i| i.even? }.sort
    @machine_steps = state.select.with_index { |s,i| i.odd? }.sort
  end

  def choose
    results = collect_results
    return results[:machine]['4'] if results[:machine]['4']
    return results[:human]['4'] if results[:human]['4']
    return results[:machine]['3'] if results[:machine]['3']
    return results[:human]['3'] if results[:human]['3']
    return results[:machine]['2'] if results[:machine]['2']
    return results[:human]['2'] if results[:human]['2']
    results[:machine]['1']
  end

  private

  def collect_results
    hash = { machine: {}, human: {} }
    [machine_steps, human_steps].each_with_index do |arr, index|
      hash_index = index == 0 ? :machine : :human
      arr.each do |step|
        [%w(up down), %w(left right), ['left up', 'right down'], ['left down', 'right up']].each do |dirs|
          result = [step]
          dirs.each do |dir|
            el = closest_element(step, dir)
            while arr.include?(el)
              result.push(el)
              el = closest_element(el, dir)
            end
          end
          result = result.sort.sort_by { |r| r.length }
          f = closest_element(result[0], dirs[0])
          f = closest_element(result[-1], dirs[1]) if f.nil? || state.include?(f)
          next if f.nil? || state.include?(f)
          hash[hash_index][result.length.to_s] = f
        end
      end
    end
    hash
  end

  def closest_element(step, direction)
    char = step[0]
    index = ('a'..'o').to_a.index(char)
    numb = step[1..-1].to_i
    case direction
    when 'up'
      return nil if numb == 1
       "#{char}#{numb - 1}"
    when 'down'
      return nil if numb == 15
      "#{char}#{numb + 1}"
    when 'right'
      return nil if char == 'o'
      "#{('a'..'o').to_a[index + 1]}#{numb}"
    when 'left'
      return nil if char == 'a'
      "#{('a'..'o').to_a[index - 1]}#{numb}"
    when 'right up'
      return nil if char == 'o' || numb == 15
      "#{('a'..'o').to_a[index + 1]}#{numb + 1}"
    when 'right down'
      return nil if char == 'o' || numb == 1
      "#{('a'..'o').to_a[index + 1]}#{numb - 1}"
    when 'left up'
      return nil if char == 'a' || numb == 15
      "#{('a'..'o').to_a[index - 1]}#{numb + 1}"
    when 'left down'
      return nil if char == 'a' || numb == 1
      "#{('a'..'o').to_a[index - 1]}#{numb - 1}"
    end
  end
end
