require 'bike'

describe Bike do
  it { should respond_to(:working?) }

  describe '#report_bike' do
    it 'reports broken bike' do
      bike = Bike.new
      expect(bike.report_bike).to eq true
    end
  end
end

