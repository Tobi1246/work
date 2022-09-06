class Station 
  attr_reader :name, :train_list

  def initialize(name)
    @name = name
    @train_list = []
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
  
