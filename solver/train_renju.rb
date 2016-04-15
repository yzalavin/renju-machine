class TrainRenju
  def from_dataset(examples)
    examples.each do |ex|
      train_from_example(ex)
    end
  end

  def by_simulation
  end

  private

  def train_from_example(ex)
    # human = ex.select.with_index { |s,i| i.even? }.sort
    # machine = ex.select.with_index { |s,i| i.odd? }.sort
    
  end
end
