class Route 
  attr_reader :start_station, :end_station, :station, :name

  include InstanceCounter 
  NAME_ROUTE = /[a-zа-я]+-?[a-zа-я]*/i 

  def initialize (name, start_station, end_station )
    @name = name
    @start_station = start_station
    @end_station = end_station
    @station = [start_station, end_station] 
    register_instance
    validate! 
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

  def valid?
    validate!
  true 
    rescue
  false 
  end

  protected 

  def validate! 
    raise "Название маршрута не может быть таким коротким" if name.length < 3
    raise "Некоректное название маршрута " if name !~ NAME_ROUTE
    true
  end


end

