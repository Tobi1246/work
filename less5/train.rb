# frozen_string_literal: true

class Train
  attr_reader :number, :type, :speed, :current_station, :route, :wagons, :train

  include CompanyMaker
  include InstanceCounter

  NAMBER_TRAIN = /^[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}$/i.freeze

  def initialize(number)
    @number = number.upcase
    @speed = 0
    @wagons = []
    validate!
    register_instance
    @@trains[number] = self
  end

  def iterate_wagons(&block)
    raise ArgumentError, 'No block given' unless block_given?

    @wagons.each.with_index(1, &block)
  end

  def self.find(number)
    @@trains[number]
  end

  def passenger
    @type = 'Passenger'
  end

  def cargo
    @type = 'Cargo'
  end

  def delete_wagon
    if @speed.zero? && !wagons.empty?
      @wagons.pop
    else
      puts 'EROR speed != 0 or type dont correct'
    end
  end

  def add_wagon(wagon)
    @wagons << wagon if @speed.zero? && type == wagon.type
    puts 'EROR speed != 0 or type dont correct' if @speed != 0
  end

  def get_route(route)
    @route = route
    @current_station = route.start_station
    @current_station_index = 0
    @current_station.add_train(self)
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
    @current_station.add_train(self)
  end

  def go_prev
    @current_station.send_train(self)
    @current_station = prev_station if prev_station
    @current_station.add_train(self)
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private # мы не управляем поездом

  def up_speed(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def validate!
    raise 'Некоректный номер поезда! Пример номера :H25-A2, AH4V2' if number !~ NAMBER_TRAIN

    true
  end
end
