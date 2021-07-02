require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike }
  let(:bike_2) { double :bike_2 }
  
  describe '#dock' do

    it 'raises an error when station is full' do
      subject.capacity.times { subject.dock(bike)}
      expect { subject.dock(bike) }.to raise_error 'Station full'
    end

    it 'responds with a bike that had been docked' do
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

    it 'takes in broken bikes' do
      allow(bike).to receive(:report_bike).and_return(true)
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
      allow(bike).to receive(:broken?).and_return(false)
      subject.dock(bike)
      subject.dock(bike_2)
      expect(subject.release_bike(bike)).to eq [bike_2]
    end

    it 'raise error if bike broken' do
      allow(bike).to receive(:report_bike).and_return(true)
      allow(bike).to receive(:broken?).and_return(true)
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