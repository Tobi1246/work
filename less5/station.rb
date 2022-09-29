class Station 
  attr_reader :name, :train_list
  include InstanceCounter 
  NAME_STATION = /[a-zа-я]+-?[a-zа-я]*/i 
  @@station = []

  def initialize(name)
    @@station << self 
    @name = name.to_s
    @train_list = []
    register_instance
    validate!
  end

  def iterate_trains
    raise ArgumentError, "No block given" unless block_given?

    @train_list.each do |train|
      yield train
    end
  end

  def self.all
    @@station
  end

  def set_train(train)
    @train_list << train
  end

  def type_trains(type)
    @train_list.select {|train|  train.type == type }
  end

  def send_train(train)
    @train_list.delete(train)
  end

  def valid?
    validate!
  true 
    rescue
  false 
  end

  protected 

  def validate! 
    raise "Название станции не может быть таким коротким" if name.length < 3
    raise "Некоректное название станции"  if name !~ NAME_STATION
    true
  end



end
  
