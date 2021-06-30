require_relative 'bike'

class DockingStation

  def initialize
    @bikes = []
  end

  attr_reader :bike

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Station full' if full?
    @bikes.push(bike)
  end

  private

  def full?
    @bikes.count > 19
  end

  def empty?
    @bikes.empty?
  end

end