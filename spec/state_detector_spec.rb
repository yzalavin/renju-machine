require_relative '../solver/state_detector'

describe StateDetector do
  it 'can be initialized with an array' do
    sd = StateDetector.new(%w'1 2 3')
    expect(sd.steps).to eq %w(1 2 3)
  end
end
