# frozen_string_literal: true
class Station
  attr_reader :name, :train_list
  @@station = []

  NAME_STATION = /[a-zа-я]+-?[a-zа-я]*/i.freeze

  extend Asseccors
  include InstanceCounter
  include Validation

  validate :name, :presence
  validate :name, :format, NAME_STATION
  validate :name, :type, String
  
  def initialize(name)
    @@station << self
    @name = name.to_s
    @train_list = []
    register_instance
    validate!
  end

  def iterate_trains
    raise ArgumentError, 'No block given' unless block_given?

    @train_list.each_with_index { |train, index| yield train, index + 1 }
  end

  def self.all
    @@station
  end

  def add_train(train)
    @train_list << train
  end

  def type_trains(type)
    @train_list.select { |train| train.type == type }
  end

  def send_train(train)
    @train_list.delete(train)
  end
end

