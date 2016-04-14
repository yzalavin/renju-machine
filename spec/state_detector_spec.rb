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

  let(:draw){
    [].tap do |arr|
      ('a'..'o').each do |ch|
        15.times do |n|
          arr << ch + (n + 1).to_s
        end
      end
    end
  }

  let(:in_process){
    [
      %w(h8),
      %w(h1 h2 h3 h4 h5),
      %w(g1 g2 g4 g3 g5 g6 g7 g8 g9 g11 g10)
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
    it 'detects it' do
      machine_wins.each do |state|
        expect(StateDetector.new(state).detect).to eq :machine_wins
      end
    end
  end

  context 'when nobody wins yet' do
    it 'detects it' do
      in_process.each do |state|
        expect(StateDetector.new(state).detect).to eq :in_process
      end
    end
  end

  context 'when all stones are used' do
    it 'detects it' do
      expect(StateDetector.new(draw).detect).to eq :draw
    end
  end
end
