# frozen_string_literal: true

class Route
  attr_reader :start_station, :end_station, :station, :name

  NAME_ROUTE = /[a-zа-я]+-?[a-zа-я]*/i.freeze

  extend Asseccors
  include InstanceCounter
  include Validation

  validate :name, :presence
  validate :name, :format, NAME_ROUTE
  validate :name, :type, String

  def initialize(name, start_station, end_station)
    @name = name
    @start_station = start_station
    @end_station = end_station
    @station = [start_station, end_station]
    register_instance
    validate!
  end

  def add_station(station)
    @station.insert(-2, station)
  end

  def delete_station(station)
    @station.delete(station)
  end

  def all_station
    @station
  end
end
