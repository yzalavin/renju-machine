require_relative '../solver/next_step'

describe NextStep do
  let(:state){
    ["h8", "h9", "i9", "g7", "j10"]
  }
  it 'works' do
    p NextStep.new(state).choose
  end
end
