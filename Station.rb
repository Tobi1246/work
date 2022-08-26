class Station 
  attr_reader :name_station, :train

  def initialize(name_station)
    @name_station = name_station
    @train= []
  end

  def train(train)
    @train = train
    @train << train
  end

  def type(type)
    @train.find_all {|train| train.type == type }
        puts train 
      end
    end
  end

  def send_train(train)
    @train.delete(train)
  end
end
