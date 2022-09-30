class CargoWagon < Wagon
  attr_reader :size_v, :steal_v, :free

  def initialize (size_v)
    @size_v = size_v.to_i
    @type = :cargo
    @steal_v = 0
    @free = size_v
  end

  def steal(volume)
    if @steal_v == @size_v
      puts "#{@steal_v} = #{@size_v} больше места нету "
    else
    volume = volume.to_i
    @steal_v += volume  if (@size_v - @steal_v) >= volume
    @free = @size_v - @steal_v
    puts "Вы заняли : #{@steal_v} от общего объёма : #{@size_v},свободного объёма : #{@free}"
    end
  end

end
