class Route 
  attr_reader :start_station, :end_station, :station, :name

  def initialize (name, start_station, end_station )
    @name = name
    @start_station = start_station
    @end_station = end_station
    @station = [start_station, end_station] 
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
