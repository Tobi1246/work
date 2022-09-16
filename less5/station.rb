class Station 
  attr_reader :name, :train_list

  include InstanceCounter 

 @@station = []

  def initialize(name)
    @@station << self 
    @name = name
    @train_list = []
    register_instance
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
end
