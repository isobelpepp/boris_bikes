require_relative 'bike'

# docking station

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike(bike=[])
    raise 'No bikes available' if empty?
    raise 'Bike broken' if bike.broken?
    @bikes - [bike]
  end


  def dock(bike)
    raise 'Station full' if full?
    @bikes.push(bike)
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end