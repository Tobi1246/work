# frozen_string_literal: true

class PassengerWagon < Wagon
  attr_reader :seats, :down, :free_s

  def initialize(seats)
    @seats = seats
    @free_s = seats
    @down = 0
    @type = :passenger
  end

  def seat_down
    if @seats != @down
      @down += 1
      @free_s -= 1
      puts 'Вы успешно сели в вагон'
      puts "Всего мест в вагоне :#{@seats} ,свободных :#{@free_s} занятых :#{@down}"
    else
      puts 'Все места заняты'
    end
  end
end
