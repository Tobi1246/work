class Interface
  attr_reader :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def run
    loop do
      main_menu = [
          '1. Создать станцию',
          '2. Создать поезд',
          '3. Создать маршрут',
          '4. Назначить маршрут поезду',
          '5. Добавить вагоны к поезду',
          '6. Отцепить вагоны от поезда',
          '7. Переместить поезд по маршруту вперед',
          '8. Переместить поезд по маршруту назад',
          '9. Просмотреть список станций',
          '10. Просмотреть список поездов на станции',
          '11. добавить станцию в маршрут',
          '12. Удалить станцию из маршрута',
          '13. Информация о поезде',
          '14. Манипуляции с поездом',
          '0 - выход из меню'
      ]
      main_menu.each { |item| puts item }

      puts
      print 'Выбор действия: '

      case (gets.chomp.to_i)
      when 1 then
        create_station
      when 2 then
        create_train
      when 3 then
        create_route
      when 4 then
        set_route
      when 5 then
        add_wagon
      when 6 then
        delete_wagon
      when 7 then
        move_up
      when 8 then
        move_back
      when 9 then
        show_stations
      when 10 then
        look_trains_on_station
      when 11 then
        add_station
      when 12 then
        del_station
      when 13 then 
        look_train_wagons_list
      when 14 then
        manipulation_train_wagons
      else
        puts 'exit'
        break
      end
    end
  end

 private # У пользователя есть меню , тут ему лузить не нужно 

 def create_station 
    loop do
      print 'Введите название станции: '
      name = gets.chomp
      if !exist_station?(name)
       @stations << Station.new(name)
       puts "Станция #{name} создана"
       puts @stations.each { |item| puts item.name }
        break
      else
       puts 'Такая станция уже существует, введите другое название'
      end
    end
   rescue RuntimeError => e
   puts e.message
   retry       
 end

 def create_train
   print 'Введите номер создаваемого поезда: '
   number = gets.chomp
   print 'Выберите тип поезда: 1-посажирский, 2-грузовой: '
   type = gets.chomp.to_i 
     if type == 1 
       @trains << PassengerTrain.new(number)
     elsif type == 2
      @trains << CargoTrain.new(number)
    end
   puts "Поезд #{select_train(number)} № #{number.upcase} создан"
   rescue RuntimeError => e
   puts e.message
   retry
  end

 def create_route
   print 'Введите название маршрута: '
   name = gets.chomp.to_s
   print 'Введите начальную станцию: '
   start_station = gets.chomp
   if !exist_station?(start_station)
     puts 'Такой станции еще нет в списке'
   end   
   print 'Введите конечную станцию: '
   end_station = gets.chomp
   if !exist_station?(end_station)
    puts 'Такой станции еще нет в списке'
   end   
   @routes << Route.new(name, exist_station?(start_station), exist_station?(end_station))
   puts "Маршрут #{name} создан"
   print 'Cтанции маршрута: '
   @routes.each do |item| 
     puts item.station
    end
   rescue RuntimeError => e
   puts e.message
   retry
 end

  def set_route
    print 'Введите номер поезда для назвачения маршрута: '
    number_train = gets.chomp
    puts select_train(number_train)
    if !select_train(number_train)
      puts 'Такого поезда нет'
      return
    end
    print 'Введите название маршрута: '
    name_route = gets.chomp
    if !select_route(name_route)
      puts 'Такого маршрута нет'
    end    
    train = select_train(number_train)
    route = select_route(name_route)
    train.get_route(route)
    puts "Маршрут #{name_route} для поезда #{number_train} назначен"
    puts route.name
    puts route
   rescue RuntimeError => e
   puts e.message
   retry
  end

  def add_wagon
    print 'Введите номер поезда, к которому присоединить вагон: '
    number = gets.chomp
    if !select_train(number)
      puts 'Такого поезда нет'
      return
    end
    train = select_train(number)
    if train.type == :cargo
      print "Введите объём вагона: "
      v = gets.chomp.to_i
      train.add_wagon(CargoWagon.new(v))
    end
    if train.type == :passenger
      print "Введите ко-во мест в вагоне: "
      s = gets.chomp.to_i
      train.add_wagon(PassengerWagon.new(s))
    end
    puts 'Вагон успешно добавлен '
  end

  def delete_wagon
    print 'Введите номер поезда, от которого отцепить вагон: '
    number = gets.chomp
    if !select_train(number)
      puts 'такого поезда нет'
      return
    end
    train = select_train(number)
    if !train.wagons.empty?
      train.delete_wagon
      puts 'Вагон отцеплен'
    else
      puts 'У поезда нет вагонов'
    end
  end  

  def move_up
    print 'Какой поезд отправить вперед на одну станцию? '
    number = gets.chomp
    train = select_train(number)
    if train && train.route
      train.go_next
      puts "поезд перемещен на станцию #{train.current_station.name}"
    else
      puts 'Такого поезда нет или у поезда нет маршрута'
    end
  end

  def move_back
    print 'Какой поезд отправить назад на одну станцию? '
    number = gets.chomp
    train = select_train(number)
    if train && train.route
      train.go_prev
      puts "поезд перемещен на станцию #{train.current_station.name}"
    else
      puts 'Такого поезда нет или у поезда нет маршрута'
    end
  end

  def show_stations
    @stations.each_with_index do |item, index|
      puts "#{index + 1}: #{item.name}"
    end
  end

  def show_stations
     @stations.each_with_index do |item, index|
      puts "#{index + 1}: #{item.name}"
    end
  end

  def look_trains_on_station
    print 'Введите название станции: '
    name = gets.chomp
    exist_station?(name).train_list do |train, index|
      puts "#{index +1}: поезд № #{train.number} тип #{train.type}, вагонов - #{train.wagons.size} "
      train.iterate_wagons do |wagon, number|
        puts "Вагон #{number}: Свободных мест #{wagon.free_s} , занятых #{wagon.down} мест " if train.type == :passenger
        puts "Вагон #{number}: Сбододного объёма #{wagon.free}, занятого объёма #{wagon.steal_v}" if train.type == :cargo
      end
    end
  end

  def look_train_wagons_list
    print 'Введите номер поезда: '
    number = gets.chomp
    if !select_train(number)
      puts 'Такого поезда нет'
      return
    end
    train = select_train(number)
      puts " поезд №#{train.number} тип #{train.type}, вагонов - #{train.wagons.size} "
    train.iterate_wagons do |wagon, number|
      puts "Вагон #{number}: Свободных мест #{wagon.free_s} , занятых #{wagon.down} мест " if train.type == :passenger
      puts "Вагон #{number}: Сбододного объёма #{wagon.free}, занятого объёма #{wagon.steal_v}" if train.type == :cargo
    end
  end

  def manipulation_train_wagons
    print 'Введите номер поезда: '
    number = gets.chomp
    if !select_train(number)
      puts 'Такого поезда нет'
      return
    end
    train = select_train(number)
    puts " поезд №#{train.number} тип #{train.type}, вагонов - #{train.wagons.size} "
    if train.type == :passenger 
      puts "Выберите вагон в которых хотите сесть"   
      wagon_num = gets.chomp.to_i 
      num = wagon_num - 1
      train.wagons[num].seat_down 
    else train.type == :cargo
      puts "Выберите вагон в которых хотите поместить свой багаж" 
      wagon_num = gets.chomp.to_i
      puts "Введите вес вашего багажа " 
      volume = gets.chomp.to_i
      num = wagon_num - 1
      train.wagons[num].steal(volume) 
    end
  end

  def add_station
    print "Введите имя маршрута, в который добавить станцию: "
    name = gets.chomp
    print 'Введите имя добавляемой станции: '
    station = exist_station?(gets.chomp)
    if route_exist?(name)
      route_exist?(name).add_station(station)
    end
  end

  def del_station
    print "Введите имя маршрута,из которого удалить станцию: "
    name = gets.chomp
    print 'Введите имя удаляемой станции: '
    station = exist_station?(gets.chomp)
    if route_exist?(name)
      route_exist?(name).delete_station(station)
    end
  end

  def select_train(number_train)
   @trains.find { |item| item.number == number_train } 
  end

  def select_route(name)
   @routes.find { |item| item.name == name }
  end

  def exist_station?(name)
   @stations.find { |item| item.name == name }
  end

  def route_exist?(name)
    @routes.find { |item| item.name == name }
  end
end
