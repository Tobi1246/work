class Route 
  attr_reader :start_station, :end_station, :station

  def initialize (first_station, last_station )
    @start_station = first_station
    @end_station = last_station
    @station = [first_station, last_station]
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
