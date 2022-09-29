class CargoWagon < Wagon
  attr_reader :size_v, :steal_v, :free

  def initialize (size_v)
    @size_v = size_v.to_i
    @type = :cargo
    @steal_v = 0.to_i
    @free = size_v
  end

  def steal(v)
    if @steal_v == @size_v
      puts "#{@steal_v} = #{@size_v} больше места нету "
    else
    vu = v.to_i
    @steal_v += v  if (@size_v - @steal_v) >= v
    puts "Вы заняли #{@steal_v} от общего объёма #{@size_v}"
    end
  end

  def taken_v
    @steal_v 
  end

  def free_v
    @free = @size_v - @steal_v
  end

end
