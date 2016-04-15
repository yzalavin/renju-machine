require_relative '../solver/next_step'

describe NextStep do
  it 'works' do
    p NextStep.new(%w(a1 h8 a2 h7 a3 d9)).choose
  end
end
