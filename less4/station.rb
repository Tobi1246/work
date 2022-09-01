class Station 
  attr_reader :name_station, :train

  def initialize(name_station)
    @name_station = name_station
    @train = []
  end

  def train(train)
    @train << train
  end

    def type(type)
    @train.select {|train|  train.type == type }
  end

  def send_train(train)
    @train.delete(train)
  end
end
