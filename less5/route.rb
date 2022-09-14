class Route 
  attr_reader :start_station, :end_station, :station, :name

  include InstanceCounter 

  def initialize (name, start_station, end_station )
    @name = name
    @start_station = start_station
    @end_station = end_station
    @station = [start_station, end_station] 
    register_instance
  end

  def add_station(station)
    @station.insert(-2,station)
  end

  def delete_station(station)
    @station.delete(station)
  end

  def  all_station
   @station
  end
end

