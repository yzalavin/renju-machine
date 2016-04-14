require_relative '../solver/state_detector'

describe StateDetector do
  let(:human_wins) {
    [
      %w(h8 g1 h7 g2 h6 g3 h5 g4 h4),
      %w(a3 g5 a5 h4 a2 o9 a1 h8 a4),
      %w(h8 g5 i8 f6 j8 f8 k8 f9 l8),
      %w(h8 g5 g13 f6 e13 f8 f13 f9 i13 k8 h13),
    ]
  }

  let(:machine_wins) {
    [
      %w(h8 g1 h7 g2 h6 g3 h5 g4 h13 g5),
      %w(h8 g10 j3 g6 a2 g7 d5 g8 e4 g9),
      %w(h8 a1 o2 b1 a4 c1 b5 d1 k8 e1),
      %w(h8 d13 a2 f13 a3 e13 f4 h13 f5 g13)
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
