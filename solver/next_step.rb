class NextStep
  attr_reader :state, :human_steps, :machine_steps

  def initialize(state)
    @state = state
    @human_steps = state.select.with_index { |s,i| i.even? }.sort
    @machine_steps = state.select.with_index { |s,i| i.odd? }.sort

  end

  def choose
    return results[:machine]['4'] if results[:machine]['4'].present?
    return results[:human]['4'] if results[:human]['4'].present?
    return results[:machine]['3'] if results[:machine]['3'].present?
    return results[:human]['3'] if results[:human]['3'].present?
  end

  private

  def results
    collect_results
  end

  def collect_results
    hash = { machine: {'3': [], '4': []}, human: {'3': [], '4': []} }
    machine_steps.each do |step|
      [%w(up down), %w(right left), ['left up', 'right down'], ['left down', 'right up']].each do |dirs|
        result = []
        matched = 1
        dirs.each do |dir|
          el = closest_element(step, dir)
          while machine_steps.include?(el)
            result.push(el)
            matched += 1
            el = closest_element(el, dir)
          end
        end
        next if matched < 3
        human_steps.include?(closest_element())
      end
    end
  end

  def closest_element(step, direction)
    char = step[0]
    index = ('a'..'o').index(char)
    numb = step[1..-1].to_i
    case direction
    when 'up'
      return nil if numb == 15
       "#{char}#{numb + 1}"
    when 'down'
      return nil if numb == 1
      "#{char}#{numb - 1}"
    when 'right'
      return nil if index == 15
      "#{('a'..'o').index[index + 1]}#{numb}"
    when 'left'
      return nil if index == 1
      "#{('a'..'o').index[index - 1]}#{numb}"
    when 'right up'
      return nil if char == 'o' || numb == 15
      "#{('a'..'o').index[index + 1]}#{numb + 1}"
    when 'right down'
      return nil if char == 'o' || numb == 1
      "#{('a'..'o').index[index + 1]}#{numb - 1}"
    when 'left up'
      return nil if char == 'a' || numb == 15
      "#{('a'..'o').index[index - 1]}#{numb + 1}"
    when 'left down'
      return nil if char == 'a' || numb == 1
      "#{('a'..'o').index[index - 1]}#{numb - 1}"
    end
  end
end
