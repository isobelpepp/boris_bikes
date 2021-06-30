require 'docking_station'

describe DockingStation do
  it { should respond_to(:release_bike) }

  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bike) }

  describe "#release_bike" do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
 
    it 'raises an error when no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end 

  describe "#dock" do
    it 'raise an error when dock is full' do
      20.times {subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'Station full'
    end
  end
 
end