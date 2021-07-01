require 'docking_station'

describe DockingStation do
  
  describe '#dock' do
    it 'raises an error when station is full' do
      bike = Bike.new
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'Station full'
    end

    it 'responds with a bike that had been docked' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

    it 'takes in broken bikes' do
      bike = Bike.new
      station = DockingStation.new
      bike.report_bike
      station.dock(bike)

      expect(station.bikes).to eq [bike]
    end
  end
 
  describe '#release_bike' do
    it 'raises an error when station is empty' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
 
    it 'releases bike if there are bikes' do
    bike = Bike.new
    bike_2 = Bike.new
    subject.dock(bike)
    subject.dock(bike_2)
    expect(subject.release_bike(bike)).to eq([bike_2])
    end

    it 'raise error if bike broken' do
      bike = Bike.new
      station = DockingStation.new
      bike.report_bike
      station.dock(bike)
      expect { station.release_bike(bike) }.to raise_error 'Bike broken'
    end

  end

  describe '#initialize' do
    it 'has a default capacity of 20' do
      expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end
    it 'allows user to set a capacity instance variable' do
      station = DockingStation.new(15)
      expect(station.capacity).to eq(15)
    end
  end
  end