class Train 
  attr_reader :number, :type, :speed, :current_station, :next_station, :prev_station

  def initialize(number, type, size, speed = 0)
    @number = number
    @type = type
    @size = size
  end

  def up_speed(speed)
    @speed = speed
  end

  def stop 
    @speed = 0
  end

  def delete_size
    if (@speed == 0)
    @size -= 1
    else
      puts "EROR speed != 0"
    end
  end

  def add_size
    if (@speed == 0)
    @size += 1
    else
      puts "EROR speed != 0"
    end
  end

  def get_route(route)
    @route = route
    @current_station = route.first_station
  end

  def next_station
    @route.stations[@route.stations.index(@current_station) + 1] if @current_station != @route.last_station
  end

  def prev_station
    @route.stations[@route.stations.index(@current_station) - 1] if @current_station != @route.first_station
  end

  def go_next
    @current_station.send_train(self)
    up_speed
    @current_station = next_station if next_station
    stop
    @current_station.set_train(self)
  end

  def go_prev
    @current_station.send_train(self)
    up_speed
    @current_station = prev_station if prev_station
    stop
    @current_station.set_train(self)
  end
end