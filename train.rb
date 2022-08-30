class Train 
  attr_reader :number, :type, :speed, :current_station, :next_station, :prev_station, :get_route

  def initialize(number, type, wagon, speed = 0)
    @number = number
    @type = type
    @wagon = wagon
  end

  def up_speed(speed)
    @speed = speed
  end

  def stop 
    @speed = 0
  end

  def delete_wagon
    if @speed == 0
    @size -= 1
    else
      puts "EROR speed != 0"
    end
  end

  def add_wagon
    if @speed == 0
    @size += 1
    else
      puts "EROR speed != 0"
    end
  end

  def get_route(route)
    @route = route
    @current_station = self.route.station.first
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
end
