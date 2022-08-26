class Station 
  attr_reader :name_station, :list_train_on_station

  def initialize(name_station)
    @name_station = name_station
    @list_train_on_station = []
  end

  def train(train)
    @train = train
    @list_train_on_station << train
  end

    def type(type)
    @list_train_on_station.find_all {|train|  list_train_on_station.type == type }
        puts train 
      end
    end
  end

  def send_train(train)
    @list_train_on_station.delete(train)
  end
end
