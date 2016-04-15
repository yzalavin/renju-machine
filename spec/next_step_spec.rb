require_relative '../solver/next_step'

describe NextStep do
  it 'works' do
    p NextStep.new(%w(h8 c3 h7 d3 j11 e3)).choose
  end
end
