class Train 
  attr_reader :number, :type, :speed, :current_station, :next_station, :prev_station, :route, :wagons

  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
  end
  
  def passeger
    @type = 'Passenger'
  end

  def cargo
    @type = 'Cargo'
  end

  def get_route(route)
    @route = route
    @current_station = route.start_station
    @current_station_index = 0
    @current_station.set_train(self)
  end

  def next_station
    @route.station[@route.station.index(@current_station) + 1] if @current_station != @route.end_station
  end

  def prev_station
    @route.station[@route.station.index(@current_station) - 1] if @current_station != @route.start_station
  end

  def go_next
    @current_station.send_train(self)
    @current_station = next_station if next_station
    @current_station.set_train(self)
  end

  def go_prev
    @current_station.send_train(self)
    @current_station = prev_station if prev_station
    @current_station.set_train(self)
  end

private # мы не управляем поездом

  def up_speed(speed)
    @speed = speed
  end

  def stop 
    @speed = 0
  end

protected # методы получают доп функциалан в интервейсе и нужны только для вызова другим методом
  
  def delete_wagon
    if @speed == 0 && !wagons.empty?
       @wagons.pop 
    else
      puts "EROR speed != 0 or type dont correct"
    end
  end

  def add_wagon(wagon)
    if @speed == 0
      @wagons << wagon
    else
      puts "EROR speed != 0 or type dont correct"
    end
  end
end
