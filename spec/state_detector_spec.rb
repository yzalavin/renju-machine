require_relative '../solver/state_detector'

describe StateDetector do
  let(:human_wins) {
    [
      %w(h8 g1 h7 g2 h6 g3 h5 g4 h4),

    ]
  }

  let(:machine_wins) {
    [
      %w(h8 g1 h7 g2 h6 g3 h5 g4 h13 g5),
    ]
  }

  let(:draws){

  }

  let(:in_process){
    [
      %w(h8),
      %w(h1 h2 h3 h4 h5),
      %w()
    ]
  }

  context 'when human wins' do
    it 'detects it' do
      human_wins.each do |state|
        expect(StateDetector.new(state).detect).to eq :human_wins
      end
    end
  end

  context 'when machine wins' do
    it 'detects it', tag: true do
      machine_wins.each do |state|
        expect(StateDetector.new(state).detect).to eq :machine_wins
      end
    end
  end
end
