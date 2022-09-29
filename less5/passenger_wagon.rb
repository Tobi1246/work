class PassengerWagon < Wagon
  attr_reader :seats, :down, :free_s

  def initialize (seats)
    @seats = seats
    @free_s = seats
    @down = 0.to_i
    @type = :passenger
  end

  def seat_down
    if @seats != @down 
    @down += 1 
    @free_s -= 1 
    else
      puts "Все места заняты"
    end
  end

  def down_seats
    puts "#{@down} мест занято "
  end

  def free_seats
    puts "Свободно #{@free_s} мест "
  end  

end
