class Route < Station
  attr_reader :station
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @station = []
    @station << first_station
    @station << last_station
  end

  def station(station)
    @station.insert(-2,station)
  end

  def delete_station(station)
    @station.delete(station)
  end

  def  all_station
    @station.each do |keys|
    end
  end
end
